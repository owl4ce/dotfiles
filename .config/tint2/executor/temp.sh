#!/usr/bin/env sh

# Get hardware temperature for tint2 panel.
# https://github.com/owl4ce/dotfiles

# SPDX-License-Identifier: ISC

export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

# Sysfs thermal temperature path.
TEMPERATURE_DEVICE="/sys/devices/virtual/thermal/${TEMP_DEV}"

# Read, calculate, and display the temperature if the path is valid.
if [ -f "${TEMPERATURE_DEVICE}/temp" ]; then

    IFS= read -r TEMP <"${TEMPERATURE_DEVICE}/temp"

    echo "$((TEMP/1000))˚C"

else
    echo "Invalid ${TEMPERATURE_DEVICE} interface!"
fi

exit ${?}
