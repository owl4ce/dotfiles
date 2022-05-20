#!/usr/bin/env sh
#
# These things are run when an Openbox X Session is started.
# You may place a similar script in "${HOME}/.config/openbox/autostart" to run user-specific things.
#
# https://github.com/owl4ce/dotfiles
# ---

exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

# Run your preference audio server (for init-freedom), there was once a pulseaudio here.
#pulseaudio --log-target=syslog &

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
if [ -x "$(command -v xss-lock)" ]; then
    xss-lock -q -l -- "${JOYD_DIR}/xss-lock-tsl.sh" &
fi

# Run Music Player Daemon with album-art notification-sender whenever track was changed.
joyd_mpd_notifier
