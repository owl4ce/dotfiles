#!/usr/bin/env bash

rofi_command="rofi -theme themes/sidebar/three.rasi"

# Options
screen=""
area=""
timer=""

# Variable passed to rofi
options="$screen\n$area\n$timer"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 1)"
case $chosen in
    $screen)
        ~/.scripts/shot-now delay
        ;;
    $area)
        ~/.scripts/shot-seldraw
        ;;
    $timer)
        ~/.scripts/shot-timer
        ;;
esac
