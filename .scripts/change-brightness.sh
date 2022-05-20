#!/usr/bin/env sh

# The display brightness changer via `brightnessctl`.
# https://github.com/owl4ce/dotfiles

export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

[ -x "$(command -v brightnessctl)" ] || exec dunstify 'Install `brightnessctl`!' -h string:synchronous:install-deps \
                                                                                 -u low

[ -z "$BRIGHTNESS_DEVICE" ] || ARGS="-d ${BRIGHTNESS_DEVICE}"

case "${1}" in
    +) brightnessctl ${ARGS} set "${BRIGHTNESS_STEPS:-5}%+" -q
    ;;
    -) brightnessctl ${ARGS} set "${BRIGHTNESS_STEPS:-5}%-" -q
    ;;
esac

BRIGHTNESS="$(brightnessctl ${ARGS} get -P)"

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
                            -h string:synchronous:display-brightness \
                            -i "$ICON" \
                            -t 1000

exit ${?}
