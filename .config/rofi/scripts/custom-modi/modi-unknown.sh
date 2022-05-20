#!/usr/bin/env sh

# The custom unknown modi inside rofi.
# https://github.com/owl4ce/dotfiles

export LANG='POSIX'
exec 2>/dev/null

MESSAGE='?'

printf "\0message\037${MESSAGE}\n\0markup-rows\037true\n"
