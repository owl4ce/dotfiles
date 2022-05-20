#!/usr/bin/env sh

# The transfer sleep lock wrapper for `xss-lock`.
# https://github.com/owl4ce/dotfiles

# SPDX-License-Identifier: ISC

# shellcheck disable=SC3044

export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

# Kill locker if get killed.
trap 'kill %%' TERM INT

# https://gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html#:~:text=expand_aliases
[ -z "$BASH" ] || shopt -s expand_aliases

# Pre-lock as a background task.
{
    # Pause the current user's music player song if it's currently playing.
    [ -z "$(joyd_music_controller status)" ] || joyd_music_controller toggle

    # Pause dunst from displaying notifications while locked, and will be displayed once unlocked.
    dunstctl set-paused true
} &

# Condition of locker based on `xss-lock`-specific file descriptor.
if [ -e "/dev/fd/${XSS_SLEEP_LOCK_FD:--1}" ]; then
    # Special locker. If the lock file descriptor is open, ensure the locker doesn't inherit a copy.
    eval "$(joyd_launch_apps -g session_locker) {XSS_SLEEP_LOCK_FD}<&- &"
    # Delay in seconds. Note that by default systemd-logind allows a maximum sleep delay of 5 seconds.
    sleep 5s
    # Close the file descriptor (only remaining copy) to indicate the system is ready to sleep.
    eval "exec {XSS_SLEEP_LOCK_FD}<&-"
else
    # General locker. Uses current user's session-locker.
    eval "$(joyd_launch_apps -g session_locker) &"
fi

# Ensure all background tasks of the current process have been completed.
wait

# Post-lock as a background task.
{
    # Turn off paused dunst, so it will display notifications on queue.
    dunstctl set-paused false

    # Send notification.
    dunstify 'Session Manager' "Welcome back <u>${USER:-$(id -nu)}</u>" -h string:synchronous:session-manager \
                                                                        -a joyful_desktop \
                                                                        -i "$LOGOUT_ICON"
} &

exit ${?}
