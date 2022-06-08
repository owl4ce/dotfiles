#!/usr/bin/env sh

# Desc:   MPD track notification-sender daemon.
# Author: Harry Kurn <alternate-se7en@pm.me>
# URL:    https://github.com/owl4ce/dotfiles/tree/ng/.config/mpd/scripts/mpd-notifier.sh

# SPDX-License-Identifier: ISC

# shellcheck disable=SC2166,SC2016,SC3044

export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

[ -x "$(command -v mpd)" -a -x "$(command -v mpc)" ] || exec dunstify 'Install `mpd` and `mpc`!' \
                                                                      -h string:synchronous:install-deps \
                                                                      -a joyful_desktop \
                                                                      -u low

# https://gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html#:~:text=expand_aliases
[ -z "$BASH" ] || shopt -s expand_aliases

{
    ! pidof -s mpd -q || mpd --kill || killall -9 mpd -q

    nice -n 1 mpd || mpd || exec dunstify 'Music Player' 'Failed to execute <u>mpd</u>!' \
                                          -h string:synchronous:music-player \
                                          -a joyful_desktop \
                                          -i "$MUSIC_ICON" \
                                          -u low

    while :; do
        LAST_PLAYED_TRACK="$(mpc -p "$CHK_MPD_PORT" -f '%file%' current)"
        nice -n 19 mpc -p "$CHK_MPD_PORT" idle || mpc -p "$CHK_MPD_PORT" idle
        [ "$LAST_PLAYED_TRACK" = "$(mpc -p "$CHK_MPD_PORT" -f '%file%' current)" ] || joyd_mpd_notify_albumart
    done
} &

exit ${?}
