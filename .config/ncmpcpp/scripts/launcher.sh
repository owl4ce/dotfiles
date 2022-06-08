#!/usr/bin/env sh

# Desc:   Ncmpcpp triplet launcher.
# Author: Harry Kurn <alternate-se7en@pm.me>
# URL:    https://github.com/owl4ce/dotfiles/tree/ng/.config/ncmpcpp/scripts/launcher.sh

# SPDX-License-Identifier: ISC

# shellcheck disable=SC3044

SYSTEM_LANG="$LANG"
export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

# https://gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html#:~:text=expand_aliases
[ -z "$BASH" ] || shopt -s expand_aliases

MUSIC_PLAYER="$(joyd_launch_apps -g music_player)"

if [ "$MUSIC_PLAYER" = 'mpd' ]; then

    case "${1}" in
        '') LANG="$SYSTEM_LANG" joyd_launch_apps terminal -e ncmpcpp -q
        ;;
        a*) LANG="$SYSTEM_LANG" joyd_launch_apps terminal -g "${NCMPCPP_AA_LAUNCHER_GEOMETRY:-84x13}" \
                                                          -e ncmpcpp -c "${NCMPCPP_DIR}/album-art.config" \
                                                                     -q
        ;;
        s*) LANG="$SYSTEM_LANG" joyd_launch_apps terminal -g "${NCMPCPP_SAA_LAUNCHER_GEOMETRY:-47x18}" \
                                                          -e ncmpcpp -c "${NCMPCPP_DIR}/single.album-art.config" \
                                                                     -q
        ;;
    esac

else

    dunstify 'Music Player' "Currently <u>${MUSIC_PLAYER}</u>!" -h string:synchronous:music-player \
                                                                -a joyful_desktop \
                                                                -i "$MUSIC_ICON" \
                                                                -u low

fi

exit ${?}
