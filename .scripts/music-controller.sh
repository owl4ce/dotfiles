#!/usr/bin/env sh

# Desc:   MPD (via `mpc`) and MPRIS-enabled media players (via D-Bus) controller.
# Author: Harry Kurn <alternate-se7en@pm.me>
# URL:    https://github.com/owl4ce/dotfiles/tree/ng/.scripts/music-controller.sh

# SPDX-License-Identifier: ISC

# shellcheck disable=SC3044,SC2086

export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

# https://gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html#:~:text=expand_aliases
[ -z "$BASH" ] || shopt -s expand_aliases

MUSIC_PLAYER="$(joyd_launch_apps -g music_player)"

case "$MUSIC_PLAYER" in
    mpd  ) PREV="mpc -p \"$CHK_MPD_PORT\" prev -q"
           NEXT="mpc -p \"$CHK_MPD_PORT\" next -q"
           STOP="mpc -p \"$CHK_MPD_PORT\" stop -q"
           TOGG="mpc -p \"$CHK_MPD_PORT\" toggle -q"
    ;;
    MPRIS) DBUS='org.freedesktop.DBus'
           MP2P='org.mpris.MediaPlayer2.Player'

           PREF="$(dbus-send --print-reply --dest=${DBUS} /org/freedesktop/DBus ${DBUS}.ListNames)" \
           PREF="${PREF#*.MediaPlayer2.}"

           SEND="dbus-send --print-reply --dest=${MP2P%.*}.${PREF%%\"*} /org/mpris/MediaPlayer2"

           PREV="${SEND} ${MP2P}.Previous"
           NEXT="${SEND} ${MP2P}.Next"
           STOP="${SEND} ${MP2P}.Stop"
           TOGG="${SEND} ${MP2P}.PlayPause"
    ;;
esac

case "${1}" in
    prev) eval "exec ${PREV} >&2"
    ;;
    next) eval "exec ${NEXT} >&2"
    ;;
    stop) eval "exec ${STOP} >&2"
    ;;
    tog*) eval "exec ${TOGG} >&2"
    ;;
esac

case "$MUSIC_PLAYER" in
    mpd  ) STAT="$(mpc -p "$CHK_MPD_PORT" status | grep -m1 -Fo '[playing]')"
           TITL="$(mpc -p "$CHK_MPD_PORT" -f '[%title%|%file%]' current)"
    ;;
    MPRIS) PROP="${DBUS}.Properties.Get string:${MP2P}"
           STAT="$(${SEND} ${PROP} string:PlaybackStatus | grep -m1 -Fo '"Playing"')"
           TITL="$(${SEND} ${PROP} string:Metadata | grep -m1 -A1 -F '"xesam:title"')" \
           TITL="${TITL##*string\ \"}" \
           TITL="${TITL%%\"*}"
    ;;
    *    ) TITL='Neither MPD nor MPRIS-enabled media player installed'
    ;;
esac

case "${1}" in
    sta*) echo "$STAT"
    ;;
    tit*) echo "$TITL"
    ;;
    icon) [ -n "$STAT" ] && echo '' || echo ''
    ;;
    swi*) [ -z "$STAT" ] || eval "${TOGG} >&2 &"

          for M in mpd MPRIS; do
              [ "$MUSIC_PLAYER" != "$M" ] || continue
              sed -e "/^music_player[ ]*/s|\".*\"$|\"${M}\"|" -i "$APPS_FILE"
              dunstify 'Music Player' "Switched <u>${M}</u>" -h string:synchronous:music-player \
                                                             -a joyful_desktop \
                                                             -i "$MUSIC_ICON" \
                                                             -u low
              break
          done
    ;;
esac

exit ${?}
