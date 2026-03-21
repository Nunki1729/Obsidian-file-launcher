#!/bin/bash

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

/home/nunki/Aplicaciones/Obsidian/Obsidian-1.12.4.AppImage "obsidian://open?vault=$VAULT_NAME&file=$REL_PATH"
