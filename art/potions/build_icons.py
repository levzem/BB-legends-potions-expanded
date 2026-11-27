#!/usr/bin/env python3
"""Build native potion icons from icons.toml. Requires Python 3.11+ and Pillow.

The master Aseprite and emblem sources are read-only inputs. Outputs go to gfx/
and generated/. See README.txt for the coordinate system and tuning workflow.
"""
import argparse
import colorsys
import hashlib
import json
import math
from pathlib import Path
import re
import statistics
import struct
import sys
import tomllib
import zlib

from PIL import Image, ImageChops, ImageDraw, ImageEnhance, ImageFont

HERE = Path(__file__).resolve().parent
MOD = HERE.parents[1]
RESAMPLE = Image.Resampling.LANCZOS


def require(condition, message):
    if not condition:
        raise ValueError(message)


def read_aseprite(path):
    """Read the supported, flat one-frame RGBA template without launching Steam.

    Raw/compressed cels, offsets and opacity follow Aseprite's file specification.
    Reject unsupported features instead of silently flattening them incorrectly.
    """
    data = path.read_bytes()
    require(len(data) >= 144, f"Invalid Aseprite file: {path}")
    length, magic, frames, width, height, depth = struct.unpack_from('<I5H', data)
    require(length == len(data) and magic == 0xA5E0, f"Invalid Aseprite header: {path}")
    require(frames == 1 and depth == 32, 'Template must be one frame in RGB color mode.')
    frame_size, frame_magic, count = struct.unpack_from('<IHH', data, 128)
    if count == 0xFFFF:
        count = struct.unpack_from('<I', data, 140)[0]
    require(frame_magic == 0xF1FA and 128 + frame_size == len(data), 'Invalid frame.')
    layers, cels, pos = [], [], 144
    for _ in range(count):
        size, kind = struct.unpack_from('<IH', data, pos)
        require(size >= 6 and pos + size <= len(data), 'Invalid Aseprite chunk.')
        chunk = data[pos + 6:pos + size]
        pos += size
        if kind == 0x2004:
            flags, layer_type, child, _, _, blend, opacity = struct.unpack_from('<6HB', chunk)
            name_size = struct.unpack_from('<H', chunk, 16)[0]
            name = chunk[18:18 + name_size].decode('utf-8')
            require(layer_type == 0 and child == 0 and blend == 0,
                    f"Layer {name!r}: use a flat image layer with Normal blend mode.")
            require(name not in [layer['name'] for layer in layers], f'Duplicate layer: {name}')
            layers.append(dict(name=name, visible=bool(flags & 1), opacity=opacity,
                               image=Image.new('RGBA', (width, height))))
        elif kind == 0x2005:
            index, x, y, opacity, cel_type, z_index = struct.unpack_from('<HhhBHh', chunk)
            require(cel_type in (0, 2) and z_index == 0, 'Use ordinary raw/compressed cels.')
            w, h = struct.unpack_from('<HH', chunk, 16)
            pixels = zlib.decompress(chunk[20:]) if cel_type == 2 else chunk[20:]
            require(len(pixels) == w * h * 4, 'Invalid cel pixel count.')
            cels.append((index, x, y, opacity, Image.frombytes('RGBA', (w, h), pixels)))
    require(pos == len(data), 'Unexpected Aseprite frame contents.')
    for index, x, y, opacity, image in cels:
        layer = layers[index]
        alpha = image.getchannel('A').point(lambda a: round(a * opacity * layer['opacity'] / 65025))
        image.putalpha(alpha)
        # One cel per layer/frame; paste preserves RGB even under zero alpha.
        layer['image'].paste(image, (x, y))
    return layers


def write_aseprite(path, layers):
    """Write a new, fully editable RGBA document; never write the source file."""
    size = layers[0][1].size
    chunks = []
    def chunk(kind, data):
        return struct.pack('<IH', len(data) + 6, kind) + data
    for name, image in layers:
        require(image.size == size, 'Aseprite layer size mismatch.')
        encoded = name.encode('utf-8')
        chunks.append(chunk(0x2004, struct.pack('<6HB3xH', 3, 0, 0, 0, 0, 0, 255,
                                               len(encoded)) + encoded))
    for index, (_, image) in enumerate(layers):
        chunks.append(chunk(0x2005, struct.pack('<HhhBHh5xHH', index, 0, 0, 255, 2, 0, *size)
                            + zlib.compress(image.tobytes())))
    body = b''.join(chunks)
    frame = struct.pack('<IHHHHI', len(body) + 16, 0xF1FA, len(chunks), 100, 0, 0) + body
    header = bytearray(128)
    struct.pack_into('<IHHHHHIH', header, 0, 128 + len(frame), 0xA5E0, 1, *size, 32, 1, 100)
    header[34:36] = bytes((1, 1))
    path.write_bytes(header + frame)


def compose(images):
    image = images[0].copy()
    for top in images[1:]:
        image = Image.alpha_composite(image, top)
    return image


def rgb_hex(value):
    require(isinstance(value, str) and re.fullmatch(r'#[0-9a-fA-F]{6}', value),
            f'Expected #RRGGBB color, got {value!r}')
    return tuple(int(value[i:i+2], 16) / 255 for i in (1, 3, 5))


def recolor_liquid(image, color):
    """Change hue/saturation/value around the source midtone; preserve alpha/shading."""
    pixels = [image.getpixel((x, y)) for y in range(image.height) for x in range(image.width)]
    samples = [(colorsys.rgb_to_hsv(r/255, g/255, b/255), a)
               for r, g, b, a in pixels if a and max(r, g, b) > 10]
    require(samples, 'Liquid layer is empty.')
    colored = [(hsv, a) for hsv, a in samples if hsv[1] > .1]
    require(colored, 'Liquid layer needs some color to establish a reference hue.')
    hx = sum(math.cos(hsv[0]*math.tau)*a*hsv[1] for hsv, a in colored)
    hy = sum(math.sin(hsv[0]*math.tau)*a*hsv[1] for hsv, a in colored)
    source_h = math.atan2(hy, hx) / math.tau
    source_s = statistics.median(hsv[1] for hsv, _ in colored)
    source_v = statistics.median(hsv[2] for hsv, _ in colored)
    th, ts, tv = colorsys.rgb_to_hsv(*rgb_hex(color))
    # A power curve places the midtone at the requested value without clipping
    # highlights to white. The source's shading remains monotonic.
    gamma = math.log(max(.001, tv)) / math.log(min(.999, source_v))
    result = []
    for r, g, b, a in pixels:
        if not a:
            result.append((r, g, b, a))
            continue
        h, s, v = colorsys.rgb_to_hsv(r/255, g/255, b/255)
        rgb = colorsys.hsv_to_rgb((h + th - source_h) % 1,
                                 min(1, s * ts / source_s), v ** gamma if tv else 0)
        result.append(tuple(round(c * 255) for c in rgb) + (a,))
    tinted = Image.new('RGBA', image.size)
    tinted.putdata(result)
    return tinted


def place_emblem(source, options, size):
    if 'crop' in options:
        box = options['crop']
        require(len(box) == 4 and 0 <= box[0] < box[2] <= source.width
                and 0 <= box[1] < box[3] <= source.height, f'Invalid emblem crop: {box}')
        source = source.crop(box)
    bounds = source.getbbox()
    require(bounds is not None, 'Emblem is empty.')
    source = source.crop(bounds)
    source.putalpha(source.getchannel('A').point(lambda a: min(255, round(a * options['alpha_gain']))))
    # Mirror across the head's vertical (Y) axis before applying its label tilt.
    if options.get('flip_x', False):
        source = source.transpose(Image.Transpose.FLIP_LEFT_RIGHT)
    source = ImageEnhance.Color(source).enhance(options['saturation'])
    source = ImageEnhance.Brightness(source).enhance(options['brightness'])
    # scale=1 fits the source inside the configured box; aspect ratio is retained.
    factor = min(options['box'][0]/source.width, options['box'][1]/source.height) * options['scale']
    source = source.resize((max(1, round(source.width*factor)),
                            max(1, round(source.height*factor))), RESAMPLE)
    source = source.rotate(options['rotation'], resample=Image.Resampling.BICUBIC, expand=True)
    source.putalpha(source.getchannel('A').point(lambda a: round(a * options['opacity'])))
    x, y = options['position']
    # Avoid banker's rounding: a +1 pixel position edit must always move by +1.
    left = math.floor(x - source.width/2 + .5)
    top = math.floor(y - source.height/2 + .5)
    canvas = Image.new('RGBA', size)
    visible = source.getbbox()
    if visible is None:
        return canvas
    # Rotation adds transparent corners; only painted pixels need to fit.
    require(left + visible[0] >= 0 and top + visible[1] >= 0
            and left + visible[2] <= size[0] and top + visible[3] <= size[1],
            'Emblem leaves the canvas: reduce scale or move position.')
    canvas.alpha_composite(source, (left, top))
    return canvas


def make_effect(background, layers, options, marker_mask, edge_patch, rim, interior):
    # The inventory + overlaps the glass outline. Restore that short section
    # after removing the marker, before adding liquid and the creature emblem.
    require(options['marker_layer'] in dict(layers), 'Effect marker layer is missing.')
    potion_layers = []
    for name, source in layers:
        if name == options['marker_layer']:
            require(marker_mask.size == edge_patch.size == source.size,
                    'Effect marker mask and edge patch must match the potion canvas.')
            source = source.copy()
            source.putalpha(ImageChops.multiply(source.getchannel('A'), ImageChops.invert(marker_mask)))
            source.alpha_composite(edge_patch)
        potion_layers.append(source)
    potion = compose(potion_layers).resize(tuple(options['size']), RESAMPLE)
    layer = Image.new('RGBA', background.size)
    layer.alpha_composite(potion, tuple(options['position']))
    require(rim.size == interior.size == background.size,
            'Effect rim and interior mask must match the background canvas.')
    # Keep artwork beneath the opaque portion of the native frame. Its outer
    # antialiasing belongs to the rim alone; underlying pixels would thicken it.
    layer.putalpha(ImageChops.multiply(layer.getchannel('A'), interior))
    return compose([background, layer, rim]), layer


def preview_sheet(rows, path):
    columns, cell_w, cell_h = min(5, len(rows)), 270, 265
    sheet = Image.new('RGB', (columns * cell_w, math.ceil(len(rows)/columns) * cell_h), '#302c27')
    draw = ImageDraw.Draw(sheet)
    font = ImageFont.load_default(size=13)
    for i, (name, color, item, effect) in enumerate(rows):
        x, y = i % columns * cell_w, i // columns * cell_h
        draw.text((x+12, y+8), name.replace('_', ' '), font=font, fill='#efe3c9')
        draw.text((x+12, y+28), color, font=font, fill='#b9ad96')
        sheet.paste(item, (x+24, y+48), item)
        sheet.paste(effect, (x+174, y+53), effect)
        item2 = item.resize((140, 140), Image.Resampling.NEAREST)
        effect2 = effect.resize((112, 112), Image.Resampling.NEAREST)
        sheet.paste(item2, (x+5, y+123), item2)
        sheet.paste(effect2, (x+151, y+136), effect2)
    sheet.save(path)


def load_config(path):
    config = tomllib.loads(path.read_text())
    base = path.parent
    require(config.get('version') == 1, 'Expected config version = 1.')
    potions, families = config['potions'], config['families']
    require(potions, 'No potions defined.')
    used = {}
    for name, potion in potions.items():
        allowed = {'family', 'emblem', 'liquid_color', 'scale', 'position', 'rotation',
                   'box', 'crop', 'flip_x', 'saturation', 'brightness', 'opacity', 'alpha_gain'}
        require(set(potion) <= allowed, f'{name}: unknown settings {sorted(set(potion)-allowed)}')
        require(re.fullmatch('[a-z0-9_]+', name), f'Invalid potion id: {name}')
        require(potion['family'] in families, f'{name}: unknown family.')
        rgb_hex(potion['liquid_color'])
        key = potion['family'], potion['liquid_color'].lower()
        require(key not in used, f'{name} and {used.get(key)} share a liquid color in the same family.')
        used[key] = name
        require((base / potion['emblem']).is_file(), f'{name}: missing emblem {potion["emblem"]}')
        options = config['emblem'] | {k: v for k, v in potion.items() if k in
                  ('scale', 'position', 'rotation', 'box', 'crop', 'flip_x', 'saturation', 'brightness', 'opacity', 'alpha_gain')}
        require(options['scale'] > 0 and 0 <= options['opacity'] <= 1, f'{name}: invalid scale/opacity.')
        require(options['alpha_gain'] > 0 and options['brightness'] >= 0 and options['saturation'] >= 0,
                f'{name}: invalid alpha_gain/brightness/saturation.')
        require(len(options['position']) == 2 and len(options['box']) == 2
                and min(options['box']) > 0, f'{name}: invalid position/box.')
    # Every potion definition needs matching artwork.
    if config.get('check_mod_coverage', True):
        registry = (MOD/'mod_legends_potions_expanded/potions.nut').read_text()
        defined = set(re.findall(r'^\s*Key\s*=\s*"([a-z0-9_]+)"', registry, re.MULTILINE))
        require(defined == set(potions),
                f'Definitions/artwork mismatch. Missing: {sorted(defined-set(potions))}; '
                f'extra: {sorted(set(potions)-defined)}')
    return config


def build(config_path, only=None, output=None):
    config = load_config(config_path)
    base = config_path.parent
    template = (base / config['template']['file']).resolve()
    source_hash = hashlib.sha256(template.read_bytes()).hexdigest()
    source_layers = read_aseprite(template)
    layer_map = {layer['name']: layer for layer in source_layers}
    liquid_name = config['template']['liquid_layer']
    require(liquid_name in layer_map, f'No layer named {liquid_name!r}.')
    require(layer_map[liquid_name]['image'].size == (70, 70), 'Potion template must be 70 x 70.')
    require(layer_map[liquid_name]['visible'], 'The Liquid layer must be visible.')
    if only:
        require(only in config['potions'], f'Unknown potion {only!r}.')
    root = Path(output).resolve() if output else (base / config['output']).resolve()
    generated = root / 'art/potions/generated'
    item_dir = root / 'gfx/ui/items/consumables'
    effect_dir = root / 'gfx/skills'
    for directory in (generated, item_dir, effect_dir):
        directory.mkdir(parents=True, exist_ok=True)
    interior = Image.open(base / config['effect']['interior_mask']).convert('L')
    require(interior.size == (56, 56), 'Effect interior mask must be 56 x 56.')
    backgrounds = {}
    for family, settings in config['families'].items():
        image = Image.open(base / settings['background']).convert('RGBA')
        require(image.size == (56, 56), f'{family}: background must be 56 x 56.')
        image.putalpha(interior)
        backgrounds[family] = image
    marker_mask = Image.open(base / config['effect']['marker_mask']).convert('L')
    edge_patch = Image.open(base / config['effect']['edge_patch']).convert('RGBA')
    rim = Image.open(base / config['effect']['rim']).convert('RGBA')
    rows, manifest = [], {}
    names = [only] if only else list(config['potions'])
    for name in names:
        potion = config['potions'][name]
        require((generated / f'{name}.aseprite').resolve() != template
                and (generated / f'{name}_effect.aseprite').resolve() != template,
                'The source template must live outside generated output paths.')
        options = config['emblem'] | potion
        source = Image.open(base / potion['emblem']).convert('RGBA')
        emblem = place_emblem(source, options, (70, 70))
        layers = [(layer['name'], recolor_liquid(layer['image'], potion['liquid_color'])
                   if layer['name'] == liquid_name else layer['image'])
                  for layer in source_layers if layer['visible']]
        layers.append(('Emblem', emblem))
        item = compose([im for _, im in layers])
        effect, effect_potion = make_effect(backgrounds[potion['family']], layers, config['effect'],
                                           marker_mask, edge_patch, rim, interior)
        filename = f'legends_potions_expanded_{name}_potion.png'
        item.save(item_dir / filename)
        effect.save(effect_dir / filename)
        write_aseprite(generated / f'{name}.aseprite', layers)
        write_aseprite(generated / f'{name}_effect.aseprite',
                       [('Family background', backgrounds[potion['family']]),
                        ('Potion', effect_potion), ('Gold rim', rim)])
        rows.append((name, potion['liquid_color'], item, effect))
        manifest[name] = dict(item=f'consumables/{filename}', effect=f'skills/{filename}',
                              family=potion['family'], liquid_color=potion['liquid_color'])
    preview = generated / (f'{only}_preview.png' if only else 'preview.png')
    preview_sheet(rows, preview)
    if not only:
        (generated/'manifest.json').write_text(json.dumps(dict(template_sha256=source_hash,
                                                               icons=manifest), indent=2)+'\n')
    require(hashlib.sha256(template.read_bytes()).hexdigest() == source_hash, 'Template changed during build.')
    print(f'Built {len(rows)} potion + effect pairs; template unchanged.\nPreview: {preview}')
    return rows


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--config', type=Path, default=HERE/'icons.toml')
    parser.add_argument('--only', help='Rebuild a single potion, e.g. redback')
    parser.add_argument('--output', type=Path, help='Alternate output mod root for scratch previews')
    args = parser.parse_args()
    try:
        build(args.config.resolve(), args.only, args.output)
    except (ValueError, KeyError, OSError, struct.error, zlib.error) as error:
        print(f'Icon build failed: {error}', file=sys.stderr)
        return 1
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
