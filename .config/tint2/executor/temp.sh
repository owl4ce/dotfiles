#!/usr/bin/env sh

# Get hardware temperature for tint2 panel.
# https://github.com/owl4ce/dotfiles

export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

LINUX_THERMAL='/sys/devices/virtual/thermal'

TEMPERATURE_DEVICE="${LINUX_THERMAL}/${TEMP_DEV}"

if [ -f "${TEMPERATURE_DEVICE}/temp" ]; then
    IFS= read -r TEMP <"${TEMPERATURE_DEVICE}/temp"
    echo "$((${TEMP}/1000))˚C"
elif [ ! -d "$TEMPERATURE_DEVICE" ]; then
    echo "Invalid ${TEMP_DEV} device interface!"
    false
elif [ ! -d "$LINUX_THERMAL" ]; then
    echo "Invalid ${LINUX_THERMAL} directory path!"
    false
fi

exit ${?}
