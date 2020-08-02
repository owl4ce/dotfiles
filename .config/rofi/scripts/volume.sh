#!/usr/bin/env bash

rofi_command="rofi -theme themes/sidebar/three.rasi"

# Icons
ICON_UP=""
ICON_DOWN=""
ICON_MUTED=""

options="$ICON_UP\n$ICON_MUTED\n$ICON_DOWN"

# Main
chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 1)"
case $chosen in
    $ICON_UP)
        pamixer -i 5 ; ~/.scripts/get-volume
        ;;
    $ICON_DOWN)
        pamixer -d 5 ; ~/.scripts/get-volume
        ;;
    $ICON_MUTED)
        pamixer -t ; ~/.scripts/get-volume
        ;;
esac
