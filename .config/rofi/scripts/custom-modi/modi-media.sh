#!/usr/bin/env sh

# The custom media modi inside rofi.
# https://github.com/owl4ce/dotfiles

export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

ROW_ICON_FONT='feather 12'

B_='' B="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${B_}</span>   Increase ${AUDIO_VOLUME_STEPS}%"
C_='' C="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${C_}</span>   Decrease ${AUDIO_VOLUME_STEPS}%"
D_='' D="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${D_}</span>   Toggle mute"
F_='' F="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${F_}</span>   Brighten ${BRIGHTNESS_STEPS}%"
G_='' G="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${G_}</span>   Dim ${BRIGHTNESS_STEPS}%"

[ -z "$AUDIO_DEVICE" ] || A_ARGS="-D ${AUDIO_DEVICE}"

[ -z "$BRIGHTNESS_DEVICE" ] || B_ARGS="-d ${BRIGHTNESS_DEVICE}"

case "${@}" in
    "$B") amixer ${A_ARGS} sset Master ${AUDIO_VOLUME_STEPS:-5}%+ on -q
    ;;
    "$C") amixer ${A_ARGS} sset Master ${AUDIO_VOLUME_STEPS:-5}%- on -q
    ;;
    "$D") amixer ${A_ARGS} sset Master 1+ toggle -q
    ;;
    "$F") brightnessctl ${B_ARGS} set ${BRIGHTNESS_STEPS:-5}%+ -q
    ;;
    "$G") brightnessctl ${B_ARGS} set ${BRIGHTNESS_STEPS:-5}%- -q
    ;;
esac

AUDIO_VOLUME="$(amixer ${A_ARGS} sget Master)"
AUDIO_MUTED="${AUDIO_VOLUME##*\ \[on\]}"
AUDIO_VOLUME="${AUDIO_VOLUME#*\ \[}" \
AUDIO_VOLUME="${AUDIO_VOLUME%%\]\ *}"

BRIGHTNESS="$(brightnessctl ${B_ARGS} get -P)"

if [ "${AUDIO_VOLUME%%%}" -eq 0 -o -n "$AUDIO_MUTED" ]; then
    [ -z "$AUDIO_MUTED" ] || MUTED='---'
    A_=''
elif [ "${AUDIO_VOLUME%%%}" -lt 30 ]; then
    A_=''
elif [ "${AUDIO_VOLUME%%%}" -lt 70 ]; then
    A_=''
else
    A_=''
fi

A="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${A_}</span>   ${MUTED-${AUDIO_VOLUME%%%}}"
E_='' E="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${E_}</span>   ${BRIGHTNESS}"

MESSAGE='ᗜ‿ᗜ'

printf "\0message\037${MESSAGE}\n\0markup-rows\037true\n"
printf '%b\n' "${A}\0nonselectable\037true\n" "$B" "$C" "$D" "${E}\0nonselectable\037true\n" "$F" "$G"

exit ${?}
