#!/usr/bin/env sh

# Get network status for tint2 panel.
# https://github.com/owl4ce/dotfiles

export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

[ -x "$(command -v iwgetid)" -o -x "$(command -v ip)" ] || exec echo 'Install `wireless-tools` and/or `iproute2`!'

if GET_WL="$(iwgetid "$IFACE_WL")" && [ -n "$GET_WL" ]; then

    if ESSID="${GET_WL##*:\"}" ESSID="${ESSID%\"*}" && [ -n "$ESSID" ]; then

        if IP_WL="$(ip addr show "$IFACE_WL")" && [ -z "${IP_WL%%*inet*\ *}" ]; then

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

    if IP_ET="${GET_ET##*inet\ }" IP_ET="${IP_ET%%\ brd*}" && [ "$(echo "$IP_ET" | wc -l)" -eq 1 ]; then

        ICON=''
        STAT="${IP_ET} @ ${IFACE_ET}"

    else

        ICON=''
        STAT="No IP Address @ ${IFACE_ET}"

    fi

else

    ICON=''
    STAT="Invalid \"${IFACE_WL}\" and \"${IFACE_ET}\" network interfaces"

fi

case "${1}" in
    i*) echo "$ICON"
    ;;
    s*) echo "$STAT"
    ;;
esac

exit ${?}
