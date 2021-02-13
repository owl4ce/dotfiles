#!/usr/bin/env bash
source $HOME/.owl4ce_var

noterr() { $EXNOTIFY_SEND -u low -r 16 "Install brightnessctl!"; exit 1; }
command -v "brightnessctl" > /dev/null 2>&1 || noterr

CURRENT_BRIGHTNESS() { brightnessctl i | grep '%' | awk -F'(' '{print $2}' | awk -F'%' '{print $1}'; }

notify() {
    brightness="$(CURRENT_BRIGHTNESS)"
    
    if [[ "$brightness" = "0" ]]; then
        icon_name="notification-display-brightness-off"
    elif [[ "$brightness" -lt "10" ]]; then
        icon_name="notification-display-brightness-low"
    elif [[ "$brightness" -lt "30" ]]; then
        icon_name="notification-display-brightness-medium"
    elif [[ "$brightness" -lt "70" ]]; then
        icon_name="notification-display-brightness-medium"
    elif [[ "$brightness" -lt "100" ]]; then
        icon_name="notification-display-brightness-high"
    else
        icon_name="notification-display-brightness-full"
    fi
    
    $EXNOTIFY_SEND -i "$icon_name" -t 700 -r 1234 "$brightness "
}

case $1 in
    up)
        # +5%
        brightnessctl set $BRIGHTNESS_STEPS%+ -q
        notify
	;;
    down)
        # -5%
        brightnessctl set $BRIGHTNESS_STEPS%- -q
        notify
	;;
    optimal)
        # Toggle optimal
        brightnessctl set 25% -q
        notify
	;;
esac    
