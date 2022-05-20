#!/usr/bin/env sh

# The custom music controller modi inside rofi.
# https://github.com/owl4ce/dotfiles

export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

MESSAGE="$(joyd_music_controller title)"

if [ "$(printf "$MESSAGE" | wc -m)" -gt 6 ]; then
    MESSAGE="<span size='xx-small'>$(printf "$MESSAGE" | cut -c1-6)..</span>"
fi

printf "\0message\037${MESSAGE:-¨}\n\0markup-rows\037true\n"

ROW_ICON_FONT='feather 12'

A="<span font_desc='${ROW_ICON_FONT}' weight='bold'></span>   Previous"
B="<span font_desc='${ROW_ICON_FONT}' weight='bold'></span>   Playback"
C="<span font_desc='${ROW_ICON_FONT}' weight='bold'></span>   Next"
D="<span font_desc='${ROW_ICON_FONT}' weight='bold'></span>   Stop"

MUSIC_PLAYER="$(joyd_launch_apps -g music_player)"

if [ "$MUSIC_PLAYER" = 'mpd' ]; then
    E="<span font_desc='${ROW_ICON_FONT}' weight='bold'></span>   Single"
fi

case "${@}" in
    "$A") joyd_music_controller prev
    ;;
    "$B") joyd_music_controller toggle
    ;;
    "$C") joyd_music_controller next
    ;;
    "$D") joyd_music_controller stop
    ;;
    "$E") mpc -p ${CHK_MPD_PORT} single -q
    ;;
esac

[ -z "$(joyd_music_controller status)" ] && st_act='1' || st_urg='1'
printf "\0active\037${st_act}\n\0urgent\037${st_urg}\n"

if [ "$MUSIC_PLAYER" = 'mpd' ]; then
    STATUS="$(mpc -p ${CHK_MPD_PORT} status)"
    [ -n "${STATUS##*\ single:\ off*}" ] && si_act='4' || si_urg='4'
    printf "\0active\037${si_act}\n\0urgent\037${si_urg}\n"
fi

printf '%b\n' "$A" "$B" "$C" "$D" "$E"

exit ${?}
