#!/usr/bin/env sh

# Run rofi-extended menu with custom modi.
# https://github.com/owl4ce/dotfiles

export LANG='POSIX'
exec >/dev/null 2>&1

UNKNOWN=''
SCREENSHOT=''
SESSION=''
MEDIA=''
MUSIC=''

CUSTOM_MODI="\
${UNKNOWN}:${0%/*}/custom-modi/modi-unknown.sh,\
${SCREENSHOT}:${0%/*}/custom-modi/modi-screenshot.sh,\
${SESSION}:${0%/*}/custom-modi/modi-session.sh,\
${MEDIA}:${0%/*}/custom-modi/modi-media.sh,\
${MUSIC}:${0%/*}/custom-modi/modi-music.sh"

case "${1}" in
    un*) MODI="$UNKNOWN"
    ;;
    sc*) MODI="$SCREENSHOT"
    ;;
    se*) MODI="$SESSION"
    ;;
    me*) MODI="$MEDIA"
    ;;
    mu*) MODI="$MUSIC"
    ;;
esac

exec rofi -theme-str '@import "exts.rasi"' \
          -modi "$CUSTOM_MODI" \
          -no-show-icons \
          -no-lazy-grab \
          -no-plugins \
          -show "${MODI:-${SESSION}}"

exit ${?}
