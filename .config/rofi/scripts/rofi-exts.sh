#!/usr/bin/env sh

# Run rofi-extended menu with custom modi.
# https://github.com/owl4ce/dotfiles

export LANG='POSIX'
exec >/dev/null 2>&1

SCREENSHOT=''
SESSION=''
MUSIC=''

CUSTOM_MODI="\
${SCREENSHOT}:${0%/*}/custom-modi/modi-screenshot.sh,\
${SESSION}:${0%/*}/custom-modi/modi-session.sh,\
${MUSIC}:${0%/*}/custom-modi/modi-music.sh"

case "${1}" in
    sc*) MODI="$SCREENSHOT"
    ;;
    se*) MODI="$SESSION"
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
