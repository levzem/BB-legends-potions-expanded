set dotenv-load := true

export MOD_VERSION := `sed -n 's/^[[:space:]]*Version[[:space:]]*=[[:space:]]*"\([^"]*\)".*/\1/p' scripts/!mods_preload/mod_legends_potions_expanded.nut`
export MOD_ZIP := "mod_legends_potions_expanded-" + MOD_VERSION + ".zip"
icon_python := env_var_or_default("ICON_PYTHON", ".venv-art/bin/python")

default:
    @just --list

# Set SQUIRREL_BIN and MODERN_HOOKS_ZIP. Requires sibling source checkouts.
test:
    python3 tests/run.py

# One-time setup for the icon generator (Python 3.11+).
art-setup:
    python3 -m venv .venv-art
    .venv-art/bin/python -m pip install -r art/potions/requirements.txt

# Rebuild all potion/effect PNGs, editable Aseprite copies and the preview sheet.
icons:
    {{icon_python}} art/potions/build_icons.py

# Rebuild one potion after adjusting icons.toml, e.g. just icon redback.
icon name:
    {{icon_python}} art/potions/build_icons.py --only {{quote(name)}}

# Package game-relative paths; source files run without a compilation step.
zip:
    #!/bin/sh
    set -eu
    : "${MOD_VERSION:?Could not read the mod version from preload metadata}"
    mkdir -p dist
    stage=$(mktemp -d dist/.build.XXXXXX)
    trap 'rm -rf "$stage"' EXIT
    zip -q -X -r "$stage/$MOD_ZIP" scripts mod_legends_potions_expanded gfx -i '*.nut' '*.png'
    unzip -tq "$stage/$MOD_ZIP"
    mv -f "$stage/$MOD_ZIP" "dist/$MOD_ZIP"

# Build and install into BB_DATA_DIR, replacing only this mod's older versions.
install: zip
    #!/bin/sh
    set -eu
    : "${BB_DATA_DIR:?Set BB_DATA_DIR in .env (see .env.example) or your environment}"
    test -d "$BB_DATA_DIR"
    stage=$(mktemp "$BB_DATA_DIR/.legends-potions-expanded-install.XXXXXX")
    trap 'rm -f "$stage"' EXIT
    cat "dist/$MOD_ZIP" > "$stage"
    mv -f "$stage" "$BB_DATA_DIR/$MOD_ZIP"
    for old_zip in "$BB_DATA_DIR"/mod_legends_potions_expanded-*.zip; do
        if [ -f "$old_zip" ] && [ "$old_zip" != "$BB_DATA_DIR/$MOD_ZIP" ]; then
            rm -f "$old_zip"
        fi
    done
    rm -f "$BB_DATA_DIR"/._mod_legends_potions_expanded-*.zip
