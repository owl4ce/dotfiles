#!/usr/bin/env sh

# Desc:   Transfer sleep lock wrapper for `xss-lock`.
# Author: Harry Kurn <alternate-se7en@pm.me>
# URL:    https://github.com/owl4ce/dotfiles/tree/ng/.config/openbox/joyful-desktop/xss-lock-tsl.sh

# SPDX-License-Identifier: ISC

# shellcheck disable=SC3044

export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

trap 'kill %%' TERM INT

# https://gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html#:~:text=expand_aliases
[ -z "$BASH" ] || shopt -s expand_aliases

{
    [ -z "$(joyd_music_controller status)" ] || joyd_music_controller toggle

    dunstctl set-paused true
} &

if [ -e "/dev/fd/${XSS_SLEEP_LOCK_FD:--1}" ]; then

    eval "$(joyd_launch_apps -g session_locker) {XSS_SLEEP_LOCK_FD}<&- &"

    sleep 5s

    eval "exec {XSS_SLEEP_LOCK_FD}<&-"

else
    eval "$(joyd_launch_apps -g session_locker) &"
fi

wait

{
    dunstctl set-paused false

    dunstify 'Session Manager' "Welcome back <u>${USER:-$(id -nu)}</u>" -h string:synchronous:session-manager \
                                                                        -a joyful_desktop \
                                                                        -i "$LOGOUT_ICON"
} &

exit ${?}
