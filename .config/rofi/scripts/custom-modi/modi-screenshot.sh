#!/usr/bin/env sh

# The custom screenshot modi inside rofi.
# https://github.com/owl4ce/dotfiles

# SPDX-License-Identifier: ISC

# shellcheck disable=SC3044

export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

# For the button that launches rofi-main menu via $ROFI_RETV aka return value.
case "$ROFI_RETV" in
    28) LANG="$SYSTEM_LANG" exec "${0%/*}/../rofi-main.sh"
    ;;
esac

# Row and message icon font name and size.
ROW_ICON_FONT='feather 12'
MSG_ICON_FONT='feather 48'

# Main options.
A_='' A="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${A_}</span>   Screen"
B_='' B="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${B_}</span>   Select or Draw"
C_='' C="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${C_}</span>   Countdown ${SS_COUNTDOWN_SECONDS:-5}s"

# https://gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html#:~:text=expand_aliases
[ -z "$BASH" ] || shopt -s expand_aliases

# Single-execution options.
case "${@}" in
    "$A") joyd_screenshot_screen
    ;;
    "$B") joyd_screenshot_selection
          return ${?}
    ;;
    "$C") joyd_screenshot_countdown
    ;;
esac

# Message to display.
MESSAGE="<span font_desc='${MSG_ICON_FONT}' weight='bold'></span>"

# Display the information via rofi-specific escape sequences.
printf '%b\n' '\0use-hot-keys\037true' '\0markup-rows\037true' "\0message\037${MESSAGE}" \
              "$A" "$B" "$C"

exit ${?}
