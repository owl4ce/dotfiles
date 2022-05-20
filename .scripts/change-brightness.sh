#!/usr/bin/env sh

# The display brightness changer via `brightnessctl`.
# https://github.com/owl4ce/dotfiles

# SPDX-License-Identifier: ISC

# shellcheck disable=SC2016

export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

# Ensure `brightnessctl` already installed for safety and performance reasons.
[ -x "$(command -v brightnessctl)" ] || exec dunstify 'Install `brightnessctl`!' -h string:synchronous:install-deps \
                                                                                 -a joyful_desktop \
                                                                                 -u low

# Single-execution options.
case "${1}" in
    +) brightnessctl ${BRIGHTNESS_DEVICE:+-d "$BRIGHTNESS_DEVICE"} set "${BRIGHTNESS_STEPS:-5}%+" -q
    ;;
    -) brightnessctl ${BRIGHTNESS_DEVICE:+-d "$BRIGHTNESS_DEVICE"} set "${BRIGHTNESS_STEPS:-5}%-" -q
    ;;
esac

# Notification sender as a background task.
{
    # Get display brightness value as percentage in integer.
    BRIGHTNESS="$(brightnessctl ${BRIGHTNESS_DEVICE:+-d "$BRIGHTNESS_DEVICE"} get -P)"

    # Icons selector condition.
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

    # Send notification.
    exec dunstify "$BRIGHTNESS" -h "int:value:${BRIGHTNESS}" \
                                -a joyful_desktop \
                                -h string:synchronous:display-brightness \
                                -i "$ICON" \
                                -t 1000
} &

exit ${?}
