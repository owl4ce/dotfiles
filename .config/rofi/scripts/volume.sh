#!/usr/bin/env bash
LC_ALL=C LANG=C; source $HOME/.owl4ce_var

rofi_command="rofi -theme themes/sidebar/three-$CHK_ROFI_MOD.rasi"

# Icons
ICON_UP=""
ICON_DOWN=""
ICON_MUTED=""

options="$ICON_UP\n$ICON_MUTED\n$ICON_DOWN"

# Main
chosen="$(printf "$options\n" | $rofi_command -dmenu -selected-row 1)"
case $chosen in
    $ICON_UP)       exec $AVOLUME_CHANGER up
    ;;
    $ICON_DOWN)     exec $AVOLUME_CHANGER down
    ;;
    $ICON_MUTED)    exec $AVOLUME_CHANGER mute
    ;;
esac 

exit $?
