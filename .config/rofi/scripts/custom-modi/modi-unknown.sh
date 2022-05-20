#!/usr/bin/env sh

# The custom unknown modi inside rofi.
# https://github.com/owl4ce/dotfiles

export LANG='POSIX'
exec 2>/dev/null

MSG_ICON_FONT='feather 48'

MESSAGE="<span font_desc='${MSG_ICON_FONT}' weight='bold'></span>"

printf "\0markup-rows\037true\n\0message\037${MESSAGE}\n"

exit ${?}
