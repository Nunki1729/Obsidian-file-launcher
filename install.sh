#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REAL_USER=${SUDO_USER:-$USER}
USER_HOME=$(eval echo "~$REAL_USER")

# Crear carpetas si no existen
mkdir -p "$USER_HOME/.obsidian_app"
mkdir -p "$USER_HOME/.local/share/applications"

# Borrar instalación anterior
rm -rf "$USER_HOME/.obsidian_app"
rm -rf "$USER_HOME/.local/share/applications/obsidian.desktop"

# Copiar archivos
rsync -a \
    --exclude="install.sh" \
    --exclude="obsidian.desktop" \
    --exclude=".git" \
    "$SCRIPT_DIR/" \
    "$USER_HOME/.obsidian_app"

cp -a "$SCRIPT_DIR/obsidian.desktop" "$USER_HOME/.local/share/applications/"

echo "Instalación completada correctamente."