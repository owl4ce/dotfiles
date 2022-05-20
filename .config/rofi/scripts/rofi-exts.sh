#!/usr/bin/env sh

# Run rofi-extensions menu with custom modi.
# https://github.com/owl4ce/dotfiles

# SPDX-License-Identifier: ISC

SYSTEM_LANG="$LANG"
export LANG='POSIX'
exec >/dev/null 2>&1

# Ensure no rofi windows are running before.
! pidof -s rofi -q || ( killall -9 rofi -q && wait )

# Custom modi glyphs.
SYSINFO=''
SCREENSHOT=''
SESSION=''
MEDIA=''
MUSIC=''

# Custom modi format that passes rofi argument.
CUSTOM_MODI="\
${SYSINFO}:${0%/*}/custom-modi/modi-sysinfo.sh,\
${SCREENSHOT}:${0%/*}/custom-modi/modi-screenshot.sh,\
${SESSION}:${0%/*}/custom-modi/modi-session.sh,\
${MEDIA}:${0%/*}/custom-modi/modi-media.sh,\
${MUSIC}:${0%/*}/custom-modi/modi-music.sh"

# Single-execution options, fallback to $SYSINFO.
case "${1}" in
    sys*) MODI="$SYSINFO"
    ;;
    scr*) MODI="$SCREENSHOT"
    ;;
    ses*) MODI="$SESSION"
    ;;
    med*) MODI="$MEDIA"
    ;;
    mus*) MODI="$MUSIC"
    ;;
esac

# Execute rofi-extensions menu window.
SYSTEM_LANG="$SYSTEM_LANG" \
exec rofi -theme-str '@import "exts.rasi"' \
          -modi "$CUSTOM_MODI" \
          -no-show-icons \
          -no-lazy-grab \
          -no-plugins \
          -kb-custom-19 '' \
          -kb-move-char-back '' \
          -kb-move-char-forward '' \
          -kb-mode-previous 'Left' \
          -kb-mode-next 'Right' \
          -show "${MODI:-${SYSINFO}}"

exit ${?}
