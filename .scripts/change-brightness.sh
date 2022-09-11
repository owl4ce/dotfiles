#!/usr/bin/env sh

# Desc:   Display brightness changer via `brightnessctl`.
# Author: Harry Kurn <alternate-se7en@pm.me>
# URL:    https://github.com/owl4ce/dotfiles/tree/ng/.scripts/change-brightness.sh

# SPDX-License-Identifier: ISC

# shellcheck disable=SC2016

export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

[ -x "$(command -v brightnessctl)" ] || exec dunstify 'Install `brightnessctl`!' -h string:synchronous:install-deps \
                                                                                 -a joyful_desktop \
                                                                                 -u low

case "${1}" in
    +) brightnessctl ${BRIGHTNESS_DEVICE:+-d "$BRIGHTNESS_DEVICE"} set "${BRIGHTNESS_STEPS:-5}%+" -q
    ;;
    -) brightnessctl ${BRIGHTNESS_DEVICE:+-d "$BRIGHTNESS_DEVICE"} set "${BRIGHTNESS_STEPS:-5}%-" -q
    ;;
esac

{
    BRIGHTNESS="$(brightnessctl ${BRIGHTNESS_DEVICE:+-d "$BRIGHTNESS_DEVICE"} info)" \
    BRIGHTNESS="${BRIGHTNESS#*\ \(}" \
    BRIGHTNESS="${BRIGHTNESS%%\%\)*}"

    if [ "$BRIGHTNESS" -eq 0 ]; then
        ICON='notification-display-brightness-off'
    elif [ "$BRIGHTNESS" -lt 10 ]; then
        ICON='notification-display-brightness-low'
    elif [ "$BRIGHTNESS" -lt 70 ]; then
        ICON='notification-display-brightness-medium'
    elif [ "$BRIGHTNESS" -lt 100 ]; then
        ICON='notification-display-brightness-high'
    else
        ICON='notification-display-brightness-full'
    fi

    exec dunstify "$BRIGHTNESS" -h "int:value:${BRIGHTNESS}" \
                                -a joyful_desktop \
                                -h string:synchronous:display-brightness \
                                -i "$ICON" \
                                -t 1000
} &

exit ${?}
