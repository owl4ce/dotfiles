#!/usr/bin/env bash
LC_ALL=C LANG=C; source "$HOME"/.owl4ce_var

rofi_command="rofi -theme themes/sidebar/six-${CHK_ROFI_MOD}.rasi"

# Gets the current status of mpd (for us to parse it later on)
status="$($MUSIC_CONTROLLER status)"

# Defines the Play / Pause option content
if [[ "$status" = *"laying"* ]]; then
    play_pause=""
else
    play_pause=""
fi; active="" urgent=""

# Display if repeat mode is on / off
tog_repeat=""
if [[ "$status" = *"single: on"* ]]; then
    active="-a 4"
elif [[ "$status" = *"single: off"* ]]; then
    urgent="-u 4"
else
    tog_repeat=""
fi

[[ -n "$urgent" ]] && urgent+=",5" || urgent="-u 5"
stop="" next="" previous="" tog_stream=""

# Variable passed to rofi
options="${previous}\n${play_pause}\n${stop}\n${next}\n${tog_repeat}\n${tog_stream}"

# Get the current playing song
current="$($MUSIC_CONTROLLER title)"

# If mpd isn't running it will return an empty string, we don't want to display that
[[ -z "$current" ]] && current="-" || :

# Spawn the mpd menu with the "Play / Pause" entry selected by default
chosen="$(printf "${options}\n" | $rofi_command -dmenu $active $urgent -selected-row 1)"
case "$chosen" in
    "$previous")      exec "$MUSIC_CONTROLLER" prev
    ;;
    "$play_pause")    exec "$MUSIC_CONTROLLER" toggle
    ;;
    "$stop")          exec "$MUSIC_CONTROLLER" stop
    ;;
    "$next")          exec "$MUSIC_CONTROLLER" next
    ;;
    "$tog_repeat")    exec mpc -q single
    ;;
    "$tog_stream")    exec "$MUSIC_CONTROLLER" switchpl
    ;;
esac 

exit $?
