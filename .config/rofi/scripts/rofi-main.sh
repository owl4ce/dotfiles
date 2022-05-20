#!/usr/bin/env sh

# Run rofi-main menu with built-in modi.
# https://github.com/owl4ce/dotfiles

# SPDX-License-Identifier: ISC

SYSTEM_LANG="$LANG"
export LANG='POSIX'
exec >/dev/null 2>&1

# Ensure no rofi windows are running before.
! pidof -s rofi -q || ( killall -9 rofi -q && wait )

# Execute rofi-main menu window.
LANG="$SYSTEM_LANG" \
exec rofi -theme-str '@import "main.rasi"' \
          -no-lazy-grab \
          -show drun

exit ${?}
