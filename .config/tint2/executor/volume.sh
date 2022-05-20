#!/usr/bin/env sh

# Get status or control audio-volume via `amixer`.
# https://github.com/owl4ce/dotfiles

# SPDX-License-Identifier: ISC

# shellcheck disable=SC2016,SC2166

export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

# Ensure `alsa-utils` already installed for safety and performance reasons.
[ -x "$(command -v amixer)" ] || exec echo 'Install `alsa-utils`!'

# Single-execution options to control.
case "${1}" in
    +) exec amixer ${AUDIO_DEVICE:+-D "$AUDIO_DEVICE"} sset Master "${AUDIO_VOLUME_STEPS:-5}%+" on -q
    ;;
    -) exec amixer ${AUDIO_DEVICE:+-D "$AUDIO_DEVICE"} sset Master "${AUDIO_VOLUME_STEPS:-5}%-" on -q
    ;;
    0) exec amixer ${AUDIO_DEVICE:+-D "$AUDIO_DEVICE"} sset Master 1+ toggle -q
    ;;
esac

# Get audio-volume information.
AUDIO_VOLUME="$(amixer ${AUDIO_DEVICE:+-D "$AUDIO_DEVICE"} sget Master)"
# Get mute-state by parsing it.
AUDIO_MUTED="${AUDIO_VOLUME##*\ \[on\]}"
# Parse the audio-volume value as an integer.
AUDIO_VOLUME="${AUDIO_VOLUME#*\ \[}" \
AUDIO_VOLUME="${AUDIO_VOLUME%%\%\]\ *}"

# Condition of glyphs selector and mute-state.
if [ "$AUDIO_VOLUME" -eq 0 -o -n "$AUDIO_MUTED" ]; then
    [ -z "$AUDIO_MUTED" ] || MUTED='Muted'
    ICON=''
elif [ "$AUDIO_VOLUME" -lt 30 ]; then
    ICON=''
elif [ "$AUDIO_VOLUME" -lt 70 ]; then
    ICON=''
else
    ICON=''
fi

# Single-execution options to display status to output.
case "${1}" in
    icon) echo "${ICON:-?}"
    ;;
    per*) echo "${MUTED:-${AUDIO_VOLUME}}"
    ;;
esac

exit ${?}
