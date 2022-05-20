#!/usr/bin/env sh
#
# These things are run when an Openbox X Session is started.
# You may place a similar script in "${HOME}/.config/openbox/autostart" to run user-specific things.
#
# https://github.com/owl4ce/dotfiles
#
# shellcheck disable=SC3044,SC2091,SC2086
# ---

exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

# https://gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html#:~:text=expand_aliases
[ -z "$BASH" ] || shopt -s expand_aliases

# Run URxvt daemon if the user's current preferred terminal emulator is set to `urxvtc`.
{ [ "$(joyd_launch_apps -g terminal)" = 'urxvtc' ] && urxvtd -f -q; } &

# Run your preferred audio server here (init-freedom), there was once a pulseaudio here.
#{ pidof -s pulseaudio -q || pulseaudio --start --log-target=syslog; } &

# Setup user interface using last applied themes configuration and user's tray programs.
joyd_toggle_mode apply
joyd_tray_programs exec

# Run picom compositor (2xBUFFER) to enable shadows, transparency, rounded-corners, etc.
picom --experimental-backends -b

# Run authentication agent, execute `lxpolkit` or `polkit-gnome-authentication-agent-*`.
if [ -x "$(command -v lxpolkit)" ]; then
    lxpolkit &
else
    $(find ${LIBS_PATH} -type f -iname 'polkit-gnome-authentication-agent-*' | sed 1q) &
fi

# Run session-locker daemon, required by `loginctl` (systemd events) to manage sessions.
{ [ -x "$(command -v xss-lock)" ] && xss-lock -q -l "${JOYD_DIR}/xss-lock-tsl.sh"; } &

# Run Music Player Daemon with album-art notification-sender whenever track was changed.
joyd_mpd_notifier
