#!/usr/bin/env sh

# The MPD's track notification-sender daemon.
# https://github.com/owl4ce/dotfiles

export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

[ -x "$(command -v mpd)" -a -x "$(command -v mpc)" ] || exec dunstify 'Install `mpd` and `mpc`!' \
                                                                      -h string:synchronous:install-deps \
                                                                      -u low

{
    ! pidof -s mpd -q || mpd --kill || killall -9 mpd -q

    nice -n 1 mpd || mpd || exec dunstify 'Music Player' 'Failed to execute <u>mpd</u>!' \
                                          -h string:synchronous:music-player \
                                          -i "$MUSIC_ICON" \
                                          -u low

    while :; do
        LAST_PLAYED_TRACK="$(mpc -p ${CHK_MPD_PORT} -f '%file%' current)"
        nice -n 19 mpc -p ${CHK_MPD_PORT} idle || mpc -p ${CHK_MPD_PORT} idle
        [ "$LAST_PLAYED_TRACK" = "$(mpc -p ${CHK_MPD_PORT} -f '%file%' current)" ] || joyd_mpd_notify_albumart
    done
} &

exit ${?}
