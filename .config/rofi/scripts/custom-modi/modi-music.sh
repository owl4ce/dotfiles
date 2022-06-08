#!/usr/bin/env sh

# Desc:   Custom music controller modi for rofi.
# Author: Harry Kurn <alternate-se7en@pm.me>
# URL:    https://github.com/owl4ce/dotfiles/tree/ng/.config/rofi/scripts/custom-modi/modi-music.sh

# SPDX-License-Identifier: ISC

# shellcheck disable=SC3044,SC2059

export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

case "$ROFI_RETV" in
    28) LANG="$SYSTEM_LANG" exec "${0%/*}/../rofi-main.sh"
    ;;
esac

ROW_ICON_FONT='feather 12'
MSG_ICON_FONT='feather 48'

A_='' A="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${A_}</span>   Previous"
B_='' B="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${B_}</span>   Playback"
C_='' C="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${C_}</span>   Next"
D_='' D="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${D_}</span>   Stop"

# https://gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html#:~:text=expand_aliases
[ -z "$BASH" ] || shopt -s expand_aliases

MUSIC_PLAYER="$(joyd_launch_apps -g music_player)"

case "$MUSIC_PLAYER" in
    mpd) E_='' E="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${E_}</span>   Single"
    ;;
esac

case "${@}" in
    "$A") joyd_music_controller prev
    ;;
    "$B") joyd_music_controller toggle
    ;;
    "$C") joyd_music_controller next
    ;;
    "$D") joyd_music_controller stop
    ;;
    "$E") mpc -p "$CHK_MPD_PORT" single -q
    ;;
esac

MESSAGE="$(joyd_music_controller title)"

if [ "${#MESSAGE}" -gt 8 ]; then
    MESSAGE="<span size='xx-small'>$(printf '%.9s\n' "$MESSAGE")..</span>"
elif [ "${#MESSAGE}" -gt 4 ]; then
    MESSAGE="<span size='x-small'>${MESSAGE}</span>"
elif [ -z "$MESSAGE" ]; then
    MESSAGE="<span font_desc='${MSG_ICON_FONT}' weight='bold'></span>"
fi

printf '%b\n' '\0use-hot-keys\037true' '\0markup-rows\037true' "\0message\037${MESSAGE}" \
              "$A" "$B" "$C" "$D" "$E"

[ -n "$(joyd_music_controller status)" ] && P_A='1' || P_U='1'

case "$MUSIC_PLAYER" in
    mpd) STATUS="$(mpc -p "$CHK_MPD_PORT" status)"
         [ -n "${STATUS##*single:\ off*}" ] && S_A='4' || S_U='4'
    ;;
esac

printf "\0active\037${P_A}\n\0urgent\037${P_U}\n\0active\037${S_A}\n\0urgent\037${S_U}\n"

exit ${?}
