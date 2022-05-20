#!/usr/bin/env sh

# Get network status for tint2 panel.
# https://github.com/owl4ce/dotfiles

# SPDX-License-Identifier: ISC

# shellcheck disable=SC2166,SC2016

export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

# Ensure `wireless-tools` and/or `iproute2` already installed for safety and performance reasons.
[ -x "$(command -v iwgetid)" -o -x "$(command -v ip)" ] || exec echo 'Install `wireless-tools` and/or `iproute2`!'

# Condition of available wireless interface, fallback to ether interface IP address, or set invalid.
if GET_WL="$(iwgetid "$IFACE_WL")" && [ -n "$GET_WL" ]; then

    # Parse ESSID.
    ESSID="${GET_WL##*:\"}" ESSID="${ESSID%\"}"

    # Condition of ESSID when available or connected.
    if [ -n "$ESSID" ]; then

        # Get IP address of wireless interface.
        IP_WL="$(ip addr show "$IFACE_WL")"

        # Set the status of the ESSID and its interface if the IP address is available.
        if [ -z "${IP_WL%%*inet*\ *}" ]; then
            ICON=''
            STAT="${ESSID} @ ${IFACE_WL}"
        else
            ICON=''
            STAT="No IP Address @ ${IFACE_WL}"
        fi

    else
        ICON=''
        STAT="Disconnected @ ${IFACE_WL}"
    fi

elif GET_ET="$(ip addr show "$IFACE_ET")" && [ -n "$GET_ET" ]; then

    # Parse IP address.
    IP_ET="${GET_ET##*inet\ }" IP_ET="${IP_ET%%\ brd*}"

    # Set the status of the IP address and its interface when available.
    case "$IP_ET" in
        *'
'*       ) ICON=''
           STAT="No IP Address @ ${IFACE_ET}"
        ;;
        *) ICON=''
           STAT="${IP_ET} @ ${IFACE_ET}"
        ;;
    esac

else
    ICON=''
    STAT="Invalid \"${IFACE_WL}\" and \"${IFACE_ET}\" network interfaces"
fi

# Single-execution options to display status to output.
case "${1}" in
    icon) echo "$ICON"
    ;;
    sta*) echo "$STAT"
    ;;
esac

exit ${?}
