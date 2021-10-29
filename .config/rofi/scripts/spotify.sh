#!/usr/bin/env bash
export LC_ALL=POSIX LANG=POSIX; . "${HOME}/.owl4ce_var"

ROFI="rofi -theme themes/sidebar/five-${CHK_ROFI_MOD}.rasi"

A='' B='' C='' D='' E=''

status="$("$MUSIC_CONTROLLER" status)"
current="$("$MUSIC_CONTROLLER" title)"

[[ "$status" != *'laying'* ]] || B=''

active='' urgent='-a 4' 

[ -n "$current" ] || current='-'

MENU="$(printf "${A}\n${B}\n${C}\n${D}\n${E}\n" | ${ROFI} -dmenu ${active} ${urgent} -selected-row 1)"

case "$MENU" in
    "$A") exec "$MUSIC_CONTROLLER" prev
    ;;
    "$B") exec "$MUSIC_CONTROLLER" toggle
    ;;
    "$C") exec "$MUSIC_CONTROLLER" stop
    ;;
    "$D") exec "$MUSIC_CONTROLLER" next
    ;;
    "$E") exec "$MUSIC_CONTROLLER" switchpl
    ;;
esac 

exit ${?}
