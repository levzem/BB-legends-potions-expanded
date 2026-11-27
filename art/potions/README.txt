POTION ART
==========

Run from the mod folder (Python 3.11+):

    just art-setup              Install Pillow in .venv-art
    just icons                 Build all 35 potion/skill icon pairs
    just icon redback          Build one pair

To use an existing Python with Pillow, set ICON_PYTHON=/path/to/python.

Sources
-------
    potion-template.aseprite    Master bottle with Bottle and Liquid layers
    icons.toml                  Colors, emblems, placement and family assignments
    emblems/                    Enemy cutouts; origins recorded in sources.json
    skill-layers/backgrounds/  Shared family gradients and source notes
    skill-layers/              Rim, interior mask, inventory-marker mask and patch

Keep the master 70 x 70, one frame, RGB, with flat Normal-blend layers and a
visible Liquid layer. The generator reads it without changing it.

Skill icons are 56 x 56: family background, bottle, then gold rim. The interior
mask clips the bottle and background inside the rim. The marker mask removes
the inventory +; the edge patch repairs the bottle outline beneath it.
Keep these masks aligned when editing the master bottle.

Settings
--------
Edit icons.toml, then rebuild. Each potion can override the [emblem] defaults:

    [potions.redback]
    family = "spiders"
    emblem = "emblems/redback.png"
    liquid_color = "#7a1e2c"
    scale = 1.0
    position = [28, 47]
    rotation = -22.0
    flip_x = false

    position      Emblem center in the 70 x 70 canvas; x right, y down
    scale         Multiplier after fitting within box, preserving aspect ratio
    rotation      Degrees; negative is clockwise
    flip_x        Mirror horizontally before rotation
    liquid_color  Target midtone; preserves shading and alpha
    family        Shared skill-icon background

Other options: box (fit size), crop ([left, top, right, bottom] in source pixels,
right/bottom exclusive), brightness, saturation, opacity, and alpha_gain.
Paths are relative to icons.toml. Liquid colors must differ within a family.

Outputs
-------
    gfx/ui/items/consumables/   70 x 70 inventory PNGs
    gfx/skills/                56 x 56 skill PNGs
    art/potions/generated/     Layered Aseprite copies, previews and manifest

For a preview without overwriting the shipped PNGs:

    .venv-art/bin/python art/potions/build_icons.py --only redback --output /tmp/potion-preview
