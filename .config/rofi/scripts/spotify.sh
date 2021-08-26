#!/usr/bin/env bash
LC_ALL=C LANG=C; . "${HOME}/.owl4ce_var"

rofi_command="rofi -theme themes/sidebar/five-${CHK_ROFI_MOD}.rasi"

# Get the current status of spotify.
status="$("$MUSIC_CONTROLLER" status)"

# Defines the Play/Pause option content.
if [[ "$status" = *"laying"* ]]; then
    play_pause=""
else
    play_pause=""
fi; active="" urgent="-a 4" stop="" next="" previous="" tog_stream=""

# Variable passed to rofi.
options="${previous}\n${play_pause}\n${stop}\n${next}\n${tog_stream}"

# Get the current playing song.
current="$("$MUSIC_CONTROLLER" title)"

# If spotify isn't running, it will return an empty string, we don't want to display that.
[[ -z "$current" ]] && current="-" || :

# Spawn the spotify menu with the Play/Pause entry selected by default.
chosen="$(printf "${options}\n" | ${rofi_command} -dmenu ${active} ${urgent} -selected-row 1)"
case "$chosen" in
    "$previous")   exec "$MUSIC_CONTROLLER" prev
    ;;
    "$play_pause") exec "$MUSIC_CONTROLLER" toggle
    ;;
    "$stop")       exec "$MUSIC_CONTROLLER" stop
    ;;
    "$next")       exec "$MUSIC_CONTROLLER" next
    ;;
    "$tog_stream") exec "$MUSIC_CONTROLLER" switchpl
    ;;
esac 

exit $?
