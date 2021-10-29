#!/usr/bin/env bash
export LC_ALL=POSIX LANG=POSIX; . "${HOME}/.owl4ce_var"

ROFI="rofi -theme themes/sidebar/six-${CHK_ROFI_MOD}.rasi"

A='' B='' C='' D='' E='' F=''

status="$("$MUSIC_CONTROLLER" status)"
current="$("$MUSIC_CONTROLLER" title)"

[[ "$status" != *'laying'* ]] || B=''

active='' urgent=''

if [[ "$status" = *'single: on'* ]]; then
    active='-a 4'
elif [[ "$status" = *'single: off'* ]]; then
    urgent='-u 4'
else
    E=''
fi

[ -n "$urgent" ] && urgent+=',5' || urgent='-u 5'

[ -n "$current" ] || current='-'

MENU="$(printf "${A}\n${B}\n${C}\n${D}\n${E}\n${F}\n" | ${ROFI} -dmenu ${active} ${urgent} -selected-row 1)"

case "$MENU" in
    "$A") exec "$MUSIC_CONTROLLER" prev
    ;;
    "$B") exec "$MUSIC_CONTROLLER" toggle
    ;;
    "$C") exec "$MUSIC_CONTROLLER" stop
    ;;
    "$D") exec "$MUSIC_CONTROLLER" next
    ;;
    "$E") exec mpc -q single
    ;;
    "$F") exec "$MUSIC_CONTROLLER" switchpl
    ;;
esac 

exit ${?}
