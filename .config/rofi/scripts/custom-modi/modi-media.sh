#!/usr/bin/env sh

# Desc:   Custom media controller modi for rofi.
# Author: Harry Kurn <alternate-se7en@pm.me>
# URL:    https://github.com/owl4ce/dotfiles/tree/ng/.config/rofi/scripts/custom-modi/modi-media.sh

# SPDX-License-Identifier: ISC

# shellcheck disable=SC2166

export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

case "$ROFI_RETV" in
    28) LANG="$SYSTEM_LANG" exec "${0%/*}/../rofi-main.sh"
    ;;
esac

ROW_ICON_FONT='feather 12'
MSG_ICON_FONT='feather 48'

B_='' B="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${B_}</span>   Increase ${AUDIO_VOLUME_STEPS}%"
C_='' C="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${C_}</span>   Decrease ${AUDIO_VOLUME_STEPS}%"
D_='' D="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${D_}</span>   Toggle mute"
F_='' F="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${F_}</span>   Brighten ${BRIGHTNESS_STEPS}%"
G_='' G="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${G_}</span>   Dim ${BRIGHTNESS_STEPS}%"

case "${@}" in
    "$B") amixer ${AUDIO_DEVICE:+-D "$AUDIO_DEVICE"} sset Master "${AUDIO_VOLUME_STEPS:-5}%+" on -q
    ;;
    "$C") amixer ${AUDIO_DEVICE:+-D "$AUDIO_DEVICE"} sset Master "${AUDIO_VOLUME_STEPS:-5}%-" on -q
    ;;
    "$D") amixer ${AUDIO_DEVICE:+-D "$AUDIO_DEVICE"} sset Master 1+ toggle -q
    ;;
    "$F") brightnessctl ${BRIGHTNESS_DEVICE:+-d "$BRIGHTNESS_DEVICE"} set "${BRIGHTNESS_STEPS:-5}%+" -q
    ;;
    "$G") brightnessctl ${BRIGHTNESS_DEVICE:+-d "$BRIGHTNESS_DEVICE"} set "${BRIGHTNESS_STEPS:-5}%-" -q
    ;;
esac

AUDIO_VOLUME="$(amixer ${AUDIO_DEVICE:+-D "$AUDIO_DEVICE"} sget Master)"
AUDIO_MUTED="${AUDIO_VOLUME##*\ \[on\]}"
AUDIO_VOLUME="${AUDIO_VOLUME#*\ \[}" \
AUDIO_VOLUME="${AUDIO_VOLUME%%\%\]\ *}"

BRIGHTNESS="$(brightnessctl ${BRIGHTNESS_DEVICE:+-d "$BRIGHTNESS_DEVICE"} info)" \
BRIGHTNESS="${BRIGHTNESS#*\ \(}" \
BRIGHTNESS="${BRIGHTNESS%%\%\)*}"

if [ "$AUDIO_VOLUME" -eq 0 -o -n "$AUDIO_MUTED" ]; then
    [ -z "$AUDIO_MUTED" ] || MUTED='---'
    A_=''
elif [ "$AUDIO_VOLUME" -lt 30 ]; then
    A_=''
elif [ "$AUDIO_VOLUME" -lt 70 ]; then
    A_=''
else
    A_=''
fi

A="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${A_}</span>   ${MUTED-${AUDIO_VOLUME}}"
E_='' E="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${E_}</span>   ${BRIGHTNESS}"

MESSAGE="<span font_desc='${MSG_ICON_FONT}' weight='bold'></span>"

printf '%b\n' '\0use-hot-keys\037true' '\0markup-rows\037true' "\0message\037${MESSAGE}" \
              "${A}\0nonselectable\037true" "$B" "$C" "$D" "${E}\0nonselectable\037true" "$F" "$G"

exit ${?}
