#!/usr/bin/env sh

# Desc:   Custom session manager modi for rofi.
# Author: Harry Kurn <alternate-se7en@pm.me>
# URL:    https://github.com/owl4ce/dotfiles/tree/ng/.config/rofi/scripts/custom-modi/modi-session.sh

# SPDX-License-Identifier: ISC

# shellcheck disable=SC2016

export LANG='POSIX'
exec 2>/dev/null

case "$ROFI_RETV" in
    28) LANG="$SYSTEM_LANG" exec "${0%/*}/../rofi-main.sh"
    ;;
esac

ROW_ICON_FONT='feather 12'
MSG_ICON_FONT='feather 48'

A_='' A="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${A_}</span>   Poweroff"
B_='' B="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${B_}</span>   Reboot"
C_='' C="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${C_}</span>   Lock"
D_='' D="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${D_}</span>   Suspend"
E_='' E="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${E_}</span>   Hibernate"
F_='' F="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${F_}</span>   Logout"
Y_='' Y="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${Y_}</span>   Confirm"
N_='' N="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${N_}</span>   Cancel"
Z_='' Z="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${Z_}</span>   Firmware Setup"

SYSTEMCTL="$(command -v systemctl)" # owl4ce/dotfiles #180.

prompt()
{
    [ "${1}" = "$B_" ] || Z=

    PROMPT="<span font_desc='${MSG_ICON_FONT}' weight='bold'>${1}</span>"

    printf '%b\n' "\0message\037${PROMPT}" \
                  "${Y}\0info\037#${2}" "$N" "${Z}\0info\037#${2} --firmware-setup"

    exit ${?}
}

case "${@}" in
    "$A"     ) prompt "$A_" "${SYSTEMCTL:-loginctl} --no-ask-password poweroff"
    ;;
    "$B"     ) prompt "$B_" "${SYSTEMCTL:-loginctl} --no-ask-password reboot"
    ;;
    "$C"     ) eval 'exec loginctl --no-ask-password lock-session >&2'
    ;;
    "$D"     ) prompt "$D_" "${SYSTEMCTL:-loginctl} --no-ask-password suspend"
    ;;
    "$E"     ) prompt "$E_" "${SYSTEMCTL:-loginctl} --no-ask-password hibernate"
    ;;
    "$F"     ) prompt "$F_" 'loginctl --no-ask-password kill-user ${EUID:-$(id -u)} --signal=SIGKILL'
    ;;
    "$Y"|"$Z") eval "exec ${ROFI_INFO#\#} >&2"
    ;;
esac

MESSAGE=" $(date +%H %M) "

printf '%b\n' '\0use-hot-keys\037true' '\0markup-rows\037true' "\0message\037${MESSAGE}" \
              "$A" "$B" "$C" "$D" "$E" "$F"

exit ${?}
