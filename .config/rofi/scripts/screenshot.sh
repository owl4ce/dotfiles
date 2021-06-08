#!/usr/bin/env bash
LC_ALL=C LANG=C; source "$HOME"/.owl4ce_var

rofi_command="rofi -theme themes/sidebar/three-${CHK_ROFI_MOD}.rasi"

# Icons
SCREEN="" AREA="" TIMER=""

# Variable passed to rofi
options="${SCREEN}\n${AREA}\n${TIMER}"

chosen="$(printf "${options}\n" | $rofi_command -dmenu -selected-row 1)"
case "$chosen" in
    "$SCREEN")    exec "$SS_NOW" delay
    ;;
    "$AREA")      exec "$SS_DRAW"
    ;;
    "$TIMER")     exec "$SS_TIMER"
    ;;
esac 

exit $?
