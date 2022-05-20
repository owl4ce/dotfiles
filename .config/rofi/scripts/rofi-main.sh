#!/usr/bin/env sh

# Run rofi-main menu with built-in modi.
# https://github.com/owl4ce/dotfiles

exec >/dev/null 2>&1

exec rofi -theme-str '@import "main.rasi"' \
          -no-lazy-grab \
          -show drun

exit ${?}
