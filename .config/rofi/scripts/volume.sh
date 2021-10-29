#!/usr/bin/env bash
export LC_ALL=POSIX LANG=POSIX; . "${HOME}/.owl4ce_var"

ROFI="rofi -theme themes/sidebar/three-${CHK_ROFI_MOD}.rasi"

A='' B='' C=''

MENU="$(printf "${A}\n${B}\n${C}\n" | ${ROFI} -dmenu -selected-row 1)"

case "$MENU" in
    "$A") exec "$AVOLUME_CHANGER" up
    ;;
    "$C") exec "$AVOLUME_CHANGER" down
    ;;
    "$B") exec "$AVOLUME_CHANGER" mute
    ;;
esac 

exit ${?}
