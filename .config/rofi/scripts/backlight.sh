#!/usr/bin/env bash
export LC_ALL=POSIX LANG=POSIX; . "${HOME}/.owl4ce_var"

ROFI="rofi -theme themes/sidebar/three-${CHK_ROFI_MOD}.rasi"

A='' B='' C=''

MENU="$(printf "${A}\n${B}\n${C}\n" | ${ROFI} -dmenu -selected-row 1)"

case "$MENU" in
    "$A") exec "$BRIGHTNESS_HANDLER" up
    ;;
    "$C") exec "$BRIGHTNESS_HANDLER" down
    ;;
    "$B") exec "$BRIGHTNESS_HANDLER" optimal
    ;;
esac

exit ${?}
