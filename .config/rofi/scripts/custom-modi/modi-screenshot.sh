#!/usr/bin/env sh

# The custom screenshot modi inside rofi.
# https://github.com/owl4ce/dotfiles

export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

ROW_ICON_FONT='feather 12'
MSG_ICON_FONT='feather 48'

A_='' A="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${A_}</span>   Screen"
B_='' B="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${B_}</span>   Select or Draw"
C_='' C="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${C_}</span>   Countdown ${SS_COUNTDOWN_SECONDS:-5}s"

case "${@}" in
    "$A") joyd_screenshot_screen
    ;;
    "$B") joyd_screenshot_selection
          return ${?}
    ;;
    "$C") joyd_screenshot_countdown
    ;;
esac

MESSAGE="<span font_desc='${MSG_ICON_FONT}' weight='bold'></span>"

printf "\0markup-rows\037true\n\0message\037${MESSAGE}\n"
printf '%b\n' "$A" "$B" "$C"

exit ${?}
