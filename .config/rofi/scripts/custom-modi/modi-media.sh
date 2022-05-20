#!/usr/bin/env sh

# The custom media control modi inside rofi.
# https://github.com/owl4ce/dotfiles

# SPDX-License-Identifier: ISC

# shellcheck disable=SC2166

export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

# For the button that launches rofi-main menu via $ROFI_RETV aka return value.
case "$ROFI_RETV" in
    28) LANG="$SYSTEM_LANG" exec "${0%/*}/../rofi-main.sh"
    ;;
esac

# Row and message icon font name and size.
ROW_ICON_FONT='feather 12'
MSG_ICON_FONT='feather 48'

# Main options. #1
B_='' B="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${B_}</span>   Increase ${AUDIO_VOLUME_STEPS}%"
C_='' C="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${C_}</span>   Decrease ${AUDIO_VOLUME_STEPS}%"
D_='' D="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${D_}</span>   Toggle mute"
F_='' F="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${F_}</span>   Brighten ${BRIGHTNESS_STEPS}%"
G_='' G="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${G_}</span>   Dim ${BRIGHTNESS_STEPS}%"

# Single-execution options.
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

# Get audio-volume information.
AUDIO_VOLUME="$(amixer ${AUDIO_DEVICE:+-D "$AUDIO_DEVICE"} sget Master)"
# Get mute-state by parsing it.
AUDIO_MUTED="${AUDIO_VOLUME##*\ \[on\]}"
# Parse the audio-volume value as an integer.
AUDIO_VOLUME="${AUDIO_VOLUME#*\ \[}" \
AUDIO_VOLUME="${AUDIO_VOLUME%%\%\]\ *}"

# Get display brightness value as percentage in integer.
BRIGHTNESS="$(brightnessctl ${BRIGHTNESS_DEVICE:+-d "$BRIGHTNESS_DEVICE"} get -P)"

# Condition of glyphs selector and mute-state.
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

# Main options. #2
A="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${A_}</span>   ${MUTED-${AUDIO_VOLUME}}"
E_='' E="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${E_}</span>   ${BRIGHTNESS}"

# Message to display.
MESSAGE="<span font_desc='${MSG_ICON_FONT}' weight='bold'></span>"

# Display the information via rofi-specific escape sequences.
printf '%b\n' '\0use-hot-keys\037true' '\0markup-rows\037true' "\0message\037${MESSAGE}" \
              "${A}\0nonselectable\037true" "$B" "$C" "$D" "${E}\0nonselectable\037true" "$F" "$G"

exit ${?}
