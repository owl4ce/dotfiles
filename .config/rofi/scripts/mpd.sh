#!/usr/bin/env bash

rofi_command="rofi -theme themes/sidebar/six.rasi"

# Gets the current status of mpd (for us to parse it later on)
status="$(mpc status)"
# Defines the Play / Pause option content
if [[ $status == *"laying"* ]]; then
    play_pause=""
else
    play_pause=""
fi
active=""
urgent=""

# Display if repeat mode is on / off
tog_repeat=""
if [[ $status == *"single: on"* ]]; then
    active="-a 4"
elif [[ $status == *"single: off"* ]]; then
    urgent="-u 4"
else
    tog_repeat=" Parsing error"
fi
[ -n "$urgent" ] && urgent+=",5" || urgent="-u 5"
stop=""
next=""
previous=""
tog_stream=""

# Variable passed to rofi
options="$previous\n$play_pause\n$stop\n$next\n$tog_repeat\n$tog_stream"

# Get the current playing song
current=$(mpc -f %title% current)
# If mpd isn't running it will return an empty string, we don't want to display that
if [[ -z "$current" ]]; then
    current="-"
fi

# Spawn the mpd menu with the "Play / Pause" entry selected by default
chosen="$(echo -e "$options" | $rofi_command -dmenu $active $urgent -selected-row 1)"
case $chosen in
    $previous)
        mpc -q prev
        ;;
    $play_pause)
        mpc -q toggle
        ;;
    $stop)
        mpc -q stop && ~/.scripts/notify/notify-send.sh -u low -i "~/.icons/gladient/music.png" -r 8888 "Music Player" "Stopped"
        ;;
    $next)
        mpc -q next
        ;;
    $tog_repeat)
        mpc -q single
        ;;
    $tog_stream)
        echo "spotify" > ~/.config/openbox/music-player && ~/.scripts/notify/notify-send.sh -u low -i "~/.icons/gladient/music.png" -r 8888 "Music Player" "Set <u>`cat ~/.config/openbox/music-player`</u> as default"
        ;;
esac
