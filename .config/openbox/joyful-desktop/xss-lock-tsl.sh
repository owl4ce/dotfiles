#!/usr/bin/env sh

# The transfer sleep lock wrapper for `xss-lock`.
# https://github.com/owl4ce/dotfiles

export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

trap 'kill %%' TERM INT

[ -z "$(joyd_music_controller status)" ] || joyd_music_controller toggle

if [ -e "/dev/fd/${XSS_SLEEP_LOCK_FD:--1}" ]; then
    eval "\$(joyd_launch_apps -g session_locker) {XSS_SLEEP_LOCK_FD}<&- &"
    sleep 5s
    exec {XSS_SLEEP_LOCK_FD}<&-
else
    eval "\$(joyd_launch_apps -g session_locker) &"
fi

wait

dunstify 'Session Manager' "Welcome back <u>${USER:-$(id -nu)}</u>" -i "$LOGOUT_ICON" -r 83

exit ${?}
