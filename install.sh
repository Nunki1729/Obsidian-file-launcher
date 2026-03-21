#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REAL_USER=${SUDO_USER:-$USER}
USER_HOME=$(eval echo "~$REAL_USER")

# Crear carpetas
mkdir -p "$USER_HOME/.obsidian_app"
mkdir -p "$USER_HOME/.local/share/applications"

# Borrar instalación anterior
rm -rf "$USER_HOME/.obsidian_app"
rm -f "$USER_HOME/.local/share/applications/obsidian.desktop"

# Copiar archivos
rsync -a \
    --exclude="install.sh" \
    --exclude="obsidian.desktop" \
    --exclude=".git" \
    "$SCRIPT_DIR/" \
    "$USER_HOME/.obsidian_app"

# Dar permisos al launcher y al .AppImage
chmod +x "$USER_HOME/.obsidian_app/obsidian_launcher.sh"
chmod +x "$USER_HOME/.obsidian_app/Obsidian.AppImage"

# Copiar .desktop
cp "$SCRIPT_DIR/obsidian.desktop" "$USER_HOME/.local/share/applications/"

DESKTOP_FILE="$USER_HOME/.local/share/applications/obsidian.desktop"

# Reemplazar rutas
sed -i "s|__HOME__|$USER_HOME|g" "$DESKTOP_FILE"
sed -i "s|__HOME__|$USER_HOME|g" "$USER_HOME/.obsidian_app/obsidian_launcher.sh"

# Actualizar base de datos
update-desktop-database "$USER_HOME/.local/share/applications" 2>/dev/null || true

echo "Instalación completada correctamente."
