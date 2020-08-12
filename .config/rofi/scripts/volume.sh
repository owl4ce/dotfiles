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
        ~/.scripts/notify/change-volume up
        ;;
    $ICON_DOWN)
        ~/.scripts/notify/change-volume down
        ;;
    $ICON_MUTED)
        ~/.scripts/notify/change-volume mute
        ;;
esac
