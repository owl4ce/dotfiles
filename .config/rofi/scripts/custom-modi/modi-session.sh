#!/usr/bin/env sh

# The custom session control modi inside rofi.
# https://github.com/owl4ce/dotfiles

# SPDX-License-Identifier: ISC

# shellcheck disable=SC2016

export LANG='POSIX'
exec 2>/dev/null

# For the button that launches rofi-main menu via $ROFI_RETV aka return value.
case "$ROFI_RETV" in
    28) LANG="$SYSTEM_LANG" exec "${0%/*}/../rofi-main.sh"
    ;;
esac

# Row and message icon font name and size.
ROW_ICON_FONT='feather 12'
MSG_ICON_FONT='feather 48'

# Main options.
A_='' A="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${A_}</span>   Poweroff"
B_='' B="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${B_}</span>   Reboot"
C_='' C="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${C_}</span>   Lock"
D_='' D="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${D_}</span>   Suspend"
E_='' E="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${E_}</span>   Hibernate"
F_='' F="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${F_}</span>   Logout"
Y_='' Y="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${Y_}</span>   Confirm"
N_='' N="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${N_}</span>   Cancel"
Z_='' Z="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${Z_}</span>   Firmware Setup"

# Nested options.
prompt()
{
    # Set to empty to the third option if the first argument isn't to reboot.
    [ "${1}" = "$B_" ] || Z=

    # Prompt message to display.
    PROMPT="<span font_desc='${MSG_ICON_FONT}' weight='bold'>${1}</span>"

    # Display the information via rofi-specific escape sequences.
    printf '%b\n' "\0message\037${PROMPT}" \
                  "${Y}\0info\037#${2}" "$N" "${Z}\0info\037#${2} --firmware-setup"

    # Avoid both options being merged (loop) in script execution after nested options.
    exit ${?}
}

# Single-execution options.
case "${@}" in
    "$A"     ) prompt "$A_" 'loginctl --no-ask-password poweroff'
    ;;
    "$B"     ) prompt "$B_" 'loginctl --no-ask-password reboot'
    ;;
    "$C"     ) eval 'exec loginctl --no-ask-password lock-session >&2'
    ;;
    "$D"     ) prompt "$D_" 'loginctl --no-ask-password suspend'
    ;;
    "$E"     ) prompt "$E_" 'loginctl --no-ask-password hibernate'
    ;;
    "$F"     ) prompt "$F_" 'loginctl --no-ask-password kill-user ${EUID:-$(id -u)} --signal=SIGKILL'
    ;;
    "$Y"|"$Z") eval "exec ${ROFI_INFO#\#} >&2"
    ;;
esac

# Message to display.
MESSAGE=" $(date +%H %M) "

# Display the information via rofi-specific escape sequences.
printf '%b\n' '\0use-hot-keys\037true' '\0markup-rows\037true' "\0message\037${MESSAGE}" \
              "$A" "$B" "$C" "$D" "$E" "$F"

exit ${?}
