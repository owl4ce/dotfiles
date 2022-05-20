#!/usr/bin/env sh

# The MPD (via `mpc`) or Spotify (via D-Bus) controller.
# https://github.com/owl4ce/dotfiles

export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

MUSIC_PLAYER="$(joyd_launch_apps -g music_player)"

if [ "$MUSIC_PLAYER" = 'mpd' ]; then
    PREV="mpc -p ${CHK_MPD_PORT} prev -q"
    NEXT="mpc -p ${CHK_MPD_PORT} next -q"
    STOP="mpc -p ${CHK_MPD_PORT} stop -q"
    TOGG="mpc -p ${CHK_MPD_PORT} toggle -q"
    STAT="$(mpc -p ${CHK_MPD_PORT} status)" \
    STAT="${STAT%%*\[playing\]\ *}"
    TITL="$(mpc -p ${CHK_MPD_PORT} -f '[%title%|%file%]' current)"
elif [ "$MUSIC_PLAYER" = 'spotify' ]; then
    MP2P='org.mpris.MediaPlayer2.Player'
    SEND="dbus-send --print-reply --dest=${MP2P%.*}.spotify /org/mpris/MediaPlayer2"
    PROP="org.freedesktop.DBus.Properties.Get string:${MP2P}"
    PREV="${SEND} ${MP2P}.Previous"
    NEXT="${SEND} ${MP2P}.Next"
    STOP="${SEND} ${MP2P}.Stop"
    TOGG="${SEND} ${MP2P}.PlayPause"
    STAT="$(${SEND} ${PROP} string:PlaybackStatus)" \
    STAT="${STAT%%*\ \"Playing\"}"
    TITL="$(${SEND} ${PROP} string:Metadata | grep -m1 -A1 -F '"xesam:title"')" \
    TITL="${TITL##*string\ \"}" \
    TITL="${TITL%\"*}"
else
    TITL="There's no MPD nor Spotify installed"
fi

case "${1}" in
    prev) ${PREV} >&2 &
    ;;
    next) ${NEXT} >&2 &
    ;;
    stop) ${STOP} >&2 &
    ;;
    tog*) ${TOGG} >&2 &
    ;;
    sta*) echo "$STAT"
    ;;
    tit*) echo "$TITL"
    ;;
    ico*) [ -n "$STAT" ] && echo '' || echo ''
    ;;
    swi*) [ -n "$STAT" ] || ${TOGG} >&2 &

          for M in mpd spotify; do
              [ "$MUSIC_PLAYER" != "$M" ] || continue
              sed -e "/^music_player[ ]*/s|\".*\"$|\"${M}\"|" -i "$APPS_FILE"
              dunstify 'Music Player' "Switched <u>${M}</u>" -i "$MUSIC_ICON" -r 73 -u low
              break
          done
    ;;
esac

exit ${?}
