#!/usr/bin/env sh

# The custom screenshot modi inside rofi.
# https://github.com/owl4ce/dotfiles

export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

MESSAGE='^^'

printf "\0message\037${MESSAGE}\n\0markup-rows\037true\n"

ROW_ICON_FONT='feather 12'

A="<span font_desc='${ROW_ICON_FONT}' weight='bold'></span>   Screen"
B="<span font_desc='${ROW_ICON_FONT}' weight='bold'></span>   Select or Draw"
C="<span font_desc='${ROW_ICON_FONT}' weight='bold'></span>   Countdown ${SS_COUNTDOWN_SECONDS:-5}s"

case "${@}" in
    "$A") joyd_screenshot_screen
    ;;
    "$B") joyd_screenshot_selection
          return ${?}
    ;;
    "$C") joyd_screenshot_countdown
    ;;
esac

printf '%b\n' "$A" "$B" "$C"

exit ${?}
