#!/usr/bin/env bash

rofi_command="rofi -theme themes/sidebar/five.rasi"

# Gets the current status of spotify (for us to parse it later on)
status="$(playerctl -p spotify status)"
# Defines the Play / Pause option content
if [[ $status == *"laying"* ]]; then
    play_pause=""
else
    play_pause=""
fi
active=""
urgent=""
urgent="-a 4"
stop=""
next=""
previous=""
tog_stream=""

# Variable passed to rofi
options="$previous\n$play_pause\n$stop\n$next\n$tog_stream"

# Get the current playing song
current=$(playerctl -p spotify metadata title)
# If spotify isn't running it will return an empty string, we don't want to display that
if [[ -z "$current" ]]; then
    current="-"
fi

# Spawn the spotify menu with the "Play / Pause" entry selected by default
chosen="$(echo -e "$options" | $rofi_command -dmenu $active $urgent -selected-row 1)"
case $chosen in
    $previous)
        playerctl -p spotify previous
        ;;
    $play_pause)
        playerctl -p spotify play-pause
        ;;
    $stop)
        playerctl -p spotify stop && ~/.scripts/notify/notify-send.sh -u low -i "~/.icons/gladient/music.png" -r 8888 "Music Player" "Stopped"
        ;;
    $next)
        playerctl -p spotify next
        ;;
    $tog_stream)
        echo "mpd" > ~/.config/openbox/music-player && ~/.scripts/notify/notify-send.sh -u low -i "~/.icons/gladient/music.png" -r 8888 "Music Player" "Set <u>`cat ~/.config/openbox/music-player`</u> as default"
        ;;
esac
