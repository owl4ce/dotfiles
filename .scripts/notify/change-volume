#!/usr/bin/env bash
source $HOME/.owl4ce_var

noterr() { $EXNOTIFY_SEND -u low -r 15 "Install alsa-utils!"; exit 1; }
command -v "amixer" > /dev/null 2>&1 || noterr

CURRENT_VOL() { amixer -D pulse get Master | grep '%' | head -n 1 | awk -F'[' '{print $2}' | awk -F'%' '{print $1}'; }
CHK_MUTE() { amixer -D pulse get Master | grep '%' | grep -oE '[^ ]+$' | grep off; }

notify() {
    volume="$(CURRENT_VOL)"
    
    if [[ "$volume" = "0" ]]; then
        icon_name="notification-audio-volume-muted"
    elif [[ "$volume" -lt "10" ]]; then
        icon_name="notification-audio-volume-low"
    elif [[ "$volume" -lt "30" ]]; then
        icon_name="notification-audio-volume-low"
    elif [[ "$volume" -lt "70" ]]; then
        icon_name="notification-audio-volume-medium"
    else
        icon_name="notification-audio-volume-high"
    fi
    
    $EXNOTIFY_SEND -i "$icon_name" -t 700 -r 123 "$volume "
}

case $1 in
    up)
        amixer -D pulse set Master on -q
        # +5%
        amixer -D pulse sset Master $AUDIO_STEPS%+ -q
        notify
	;;
    down)
        amixer -D pulse set Master on -q
        # -5%
        amixer -D pulse sset Master $AUDIO_STEPS%- -q
        notify
	;;
    mute)
        amixer -D pulse set Master 1+ toggle -q
        if CHK_MUTE &> /dev/null; then
            icon_name="notification-audio-volume-muted"
            $EXNOTIFY_SEND -i "$icon_name" -t 700 -r 123 "Muted "
        else
            notify
        fi
	;;
esac    
