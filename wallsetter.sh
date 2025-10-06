#!/bin/bash

# Directorio base de wallpapers
WALL_DIR="$HOME/wallpapers"

# Si no se pasa argumento, elegir uno aleatorio en cualquier subcarpeta
if [ -z "$1" ]; then
    WALL=$(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" \) | shuf -n 1)
else
    WALL="$1"
fi

# Validar que exista
if [ ! -f "$WALL" ]; then
    echo "Error: el archivo $WALL no existe."
    exit 1
fi

# Configurar hyprpaper
CONF="$HOME/.config/hypr/hyprpaper.conf"
echo "preload = $WALL" > "$CONF"
echo "wallpaper = HDMI-A-1,$WALL" >> "$CONF"

# Reiniciar hyprpaper
pkill hyprpaper 2>/dev/null
hyprpaper & disown

# Generar esquema de colores
wal -i "$WALL" -n

# Recargar kitty si existe
if command -v kitty &>/dev/null; then
    kitty @ set-colors -a <(cat "$HOME/.cache/wal/colors-kitty.conf")
fi

# Recargar alacritty si existe
if [ -f "$HOME/.cache/wal/colors-alacritty.yml" ]; then
    cp "$HOME/.cache/wal/colors-alacritty.yml" "$HOME/.config/alacritty/colors.yml"
fi

# Notificación
if command -v notify-send &>/dev/null; then
    notify-send "Wallpaper cambiado" "→ $(basename "$WALL")"
fi

echo "Wallpaper cambiado a: $WALL"

