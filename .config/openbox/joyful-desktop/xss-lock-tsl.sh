#!/usr/bin/env sh

# The transfer sleep lock wrapper for `xss-lock`.
# https://github.com/owl4ce/dotfiles

# shellcheck disable=SC3022

export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

trap 'kill %%' TERM INT

[ -z "$(joyd_music_controller status)" ] || joyd_music_controller toggle

dunstctl set-paused true

if [ -e "/dev/fd/${XSS_SLEEP_LOCK_FD:--1}" ]; then
    eval "\$(joyd_launch_apps -g session_locker) {XSS_SLEEP_LOCK_FD}<&- &"
    sleep 5s
    exec {XSS_SLEEP_LOCK_FD}<&-
else
    eval "\$(joyd_launch_apps -g session_locker) &"
fi

wait

dunstctl set-paused false

dunstify 'Session Manager' "Welcome back <u>${USER:-$(id -nu)}</u>" -h string:synchronous:session-manager \
                                                                    -i "$LOGOUT_ICON"

exit ${?}
