#!/bin/bash

# Program: Obsidian file launcher
# Copyright (C) 2026 Javier Santiago (Nunki1729)
 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
 
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.

# Si se hace click en el icono se abre directamente
if [[ -z "$1" ]]; then
    __HOME__/.obsidian_app/Obsidian.AppImage & disown
    exit
fi


FILE="$1"

# Leer paths de vaults desde obsidian.json
mapfile -t paths < <(jq -r '.vaults[] | .path' ~/.config/obsidian/obsidian.json)

BEST_VAULT=""
MAX_LENGTH=0

for V in "${paths[@]}"; do
    if [[ "$FILE" == "$V"* ]]; then
        # longitud del path
        LEN=${#V}
        if (( LEN > MAX_LENGTH )); then
            MAX_LENGTH=$LEN
            BEST_VAULT="$V"
        fi
    fi
done

if [[ -z "$BEST_VAULT" ]]; then
    __HOME__/.obsidian_app/Obsidian.AppImage & disown
    exit 1
fi

VAULT_NAME=$(basename "$BEST_VAULT")

# Calcular ruta relativa
REL_PATH="${FILE#$BEST_VAULT/}"

__HOME__/.obsidian_app/Obsidian.AppImage "obsidian://open?vault=$VAULT_NAME&file=$REL_PATH"
