#!/usr/bin/env bash
source $HOME/.owl4ce_var

rofi_command="rofi -theme themes/sidebar/three-$CHK_ROFI_MOD.rasi"

# Icons
ICON_UP=""
ICON_DOWN=""
ICON_OPT=""

options="$ICON_UP\n$ICON_OPT\n$ICON_DOWN"

# Main
chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 1)"
case $chosen in
    $ICON_UP)
        $BRIGHTNESS_HANDLER up
    ;;
    $ICON_DOWN)
        $BRIGHTNESS_HANDLER down
    ;;
    $ICON_OPT)
        $BRIGHTNESS_HANDLER optimal
    ;;
esac
