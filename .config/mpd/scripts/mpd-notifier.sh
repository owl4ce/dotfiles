#!/usr/bin/env sh

# The MPD's track notification-sender daemon.
# https://github.com/owl4ce/dotfiles

# SPDX-License-Identifier: ISC

# shellcheck disable=SC2166,SC2016,SC3044

export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

# Ensure `mpd` and `mpc` already installed for safety and performance reasons.
[ -x "$(command -v mpd)" -a -x "$(command -v mpc)" ] || exec dunstify 'Install `mpd` and `mpc`!' \
                                                                      -h string:synchronous:install-deps \
                                                                      -a joyful_desktop \
                                                                      -u low

# https://gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html#:~:text=expand_aliases
[ -z "$BASH" ] || shopt -s expand_aliases

# Process as a background task.
{
    # Ensure mpd isn't running before.
    ! pidof -s mpd -q || mpd --kill || killall -9 mpd -q

    # Execute mpd with niceness, fallback to fails notification.
    nice -n 1 mpd || mpd || exec dunstify 'Music Player' 'Failed to execute <u>mpd</u>!' \
                                          -h string:synchronous:music-player \
                                          -a joyful_desktop \
                                          -i "$MUSIC_ICON" \
                                          -u low

    # Loop condition of the playing track.
    while :; do
        # Save the last played track.
        LAST_PLAYED_TRACK="$(mpc -p "$CHK_MPD_PORT" -f '%file%' current)"
        # Stop while loop, resume when event changes.
        nice -n 19 mpc -p "$CHK_MPD_PORT" idle || mpc -p "$CHK_MPD_PORT" idle
        # Send notification when current and saved tracks differ.
        [ "$LAST_PLAYED_TRACK" = "$(mpc -p "$CHK_MPD_PORT" -f '%file%' current)" ] || joyd_mpd_notify_albumart
    done
} &

exit ${?}
