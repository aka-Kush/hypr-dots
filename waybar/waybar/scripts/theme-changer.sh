#!/bin/bash

WAYBAR_DIR="$HOME/.config/waybar"

THEME=$(printf "Catppuccin\nGruvbox" | wofi --dmenu --prompt "Waybar Theme")

case "$THEME" in
  "Catppuccin")
    cp "$WAYBAR_DIR/config-cat" "$WAYBAR_DIR/config"
    cp "$WAYBAR_DIR/style-cat.css" "$WAYBAR_DIR/style.css"
    ;;
  "Gruvbox")
    cp "$WAYBAR_DIR/config-gruv" "$WAYBAR_DIR/config"
    cp "$WAYBAR_DIR/style-gruv.css" "$WAYBAR_DIR/style.css"
    ;;
  *)
    echo "No valid theme selected or canceled."
    exit 1
    ;;
esac

# Restart Waybar
pkill waybar && waybar &

