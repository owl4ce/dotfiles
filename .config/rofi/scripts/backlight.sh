#!/usr/bin/env bash

rofi_command="rofi -theme themes/sidebar/three.rasi"

# Icons
ICON_UP=""
ICON_DOWN=""
ICON_OPT=""

options="$ICON_UP\n$ICON_OPT\n$ICON_DOWN"

# Main
chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 1)"
case $chosen in
    $ICON_UP)
        brightnessctl set 5%+ ; ~/.scripts/get-brightness
        ;;
    $ICON_DOWN)
        brightnessctl set 5%- ; ~/.scripts/get-brightness
        ;;
    $ICON_OPT)
        brightnessctl set 5% ; ~/.scripts/get-brightness
        ;;
esac

