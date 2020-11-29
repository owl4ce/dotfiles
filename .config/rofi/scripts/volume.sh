#!/usr/bin/env bash
source $HOME/.owl4ce_var

rofi_command="rofi -theme themes/sidebar/three-$CHK_ROFI_MOD.rasi"

# Icons
ICON_UP=""
ICON_DOWN=""
ICON_MUTED=""

options="$ICON_UP\n$ICON_MUTED\n$ICON_DOWN"

# Main
chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 1)"
case $chosen in
    $ICON_UP)
        $AVOLUME_CHANGER up
    ;;
    $ICON_DOWN)
        $AVOLUME_CHANGER down
    ;;
    $ICON_MUTED)
        $AVOLUME_CHANGER mute
    ;;
esac
