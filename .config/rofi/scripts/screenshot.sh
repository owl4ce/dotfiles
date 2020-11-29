#!/usr/bin/env bash
source $HOME/.owl4ce_var

rofi_command="rofi -theme themes/sidebar/three-$CHK_ROFI_MOD.rasi"

# Options
screen=""
area=""
timer=""

# Variable passed to rofi
options="$screen\n$area\n$timer"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 1)"
case $chosen in
    $screen)
        $SS_NOW delay
    ;;
    $area)
        $SS_DRAW
    ;;
    $timer)
        $SS_TIMER
    ;;
esac
