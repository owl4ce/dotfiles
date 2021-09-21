#!/usr/bin/env bash
export LC_ALL=C LANG=C; . "${HOME}/.owl4ce_var"

rofi_command="rofi -theme themes/sidebar/three-${CHK_ROFI_MOD}.rasi"

# Icons.
ICON_UP="" ICON_DOWN="" ICON_OPT=""

# Variable passed to rofi.
options="${ICON_UP}\n${ICON_OPT}\n${ICON_DOWN}"

# Main.
chosen="$(printf "${options}\n" | ${rofi_command} -dmenu -selected-row 1)"
case "$chosen" in
    "$ICON_UP")   exec "$BRIGHTNESS_HANDLER" up
    ;;
    "$ICON_DOWN") exec "$BRIGHTNESS_HANDLER" down
    ;;
    "$ICON_OPT")  exec "$BRIGHTNESS_HANDLER" optimal
    ;;
esac

unset LC_ALL LANG && exit $?
