#!/usr/bin/env bash
source $HOME/.owl4ce_var

rofi_command="rofi -theme themes/sidebar/six-$CHK_ROFI_MOD.rasi"

# Gets the current status of mpd (for us to parse it later on)
status="$($MUSIC_CONTROLLER status)"
# Defines the Play / Pause option content
if [[ $status = *"laying"* ]]; then
    play_pause=""
else
    play_pause=""
fi
active=""
urgent=""

# Display if repeat mode is on / off
tog_repeat=""
if [[ $status = *"single: on"* ]]; then
    active="-a 4"
elif [[ $status = *"single: off"* ]]; then
    urgent="-u 4"
else
    tog_repeat=""
fi
[ -n "$urgent" ] && urgent+=",5" || urgent="-u 5"
stop=""
next=""
previous=""
tog_stream=""

# Variable passed to rofi
options="$previous\n$play_pause\n$stop\n$next\n$tog_repeat\n$tog_stream"

# Get the current playing song
current="$($MUSIC_CONTROLLER title)"
# If mpd isn't running it will return an empty string, we don't want to display that
if [[ -z "$current" ]]; then
    current="-"
fi

# Spawn the mpd menu with the "Play / Pause" entry selected by default
chosen="$(echo -e "$options" | $rofi_command -dmenu $active $urgent -selected-row 1)"
case $chosen in
    $previous)
        $MUSIC_CONTROLLER prev
    ;;
    $play_pause)
        $MUSIC_CONTROLLER toggle
    ;;
    $stop)
        $MUSIC_CONTROLLER stop
    ;;
    $next)
        $MUSIC_CONTROLLER next
    ;;
    $tog_repeat)
        mpc -q single
    ;;
    $tog_stream)
        $MUSIC_CONTROLLER switchpl
    ;;
esac
