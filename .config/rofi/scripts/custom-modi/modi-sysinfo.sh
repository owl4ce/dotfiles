#!/usr/bin/env sh

# Desc:   Custom system-info modi for rofi.
# Author: Harry Kurn <alternate-se7en@pm.me>
# URL:    https://github.com/owl4ce/dotfiles/tree/ng/.config/rofi/scripts/custom-modi/modi-sysinfo.sh

# SPDX-License-Identifier: ISC

# shellcheck disable=SC2166,SC2034,SC2086

export LANG='POSIX'
exec 2>/dev/null

case "$ROFI_RETV" in
    28) LANG="$SYSTEM_LANG" exec "${0%/*}/../rofi-main.sh"
    ;;
esac

ROW_ICON_FONT='feather 12'

if [ -f '/etc/os-release' ]; then

    . /etc/os-release

    A_='' A="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${A_}</span>   ${PRETTY_NAME:-${NAME}}"

fi

if [ -f '/sys/devices/virtual/dmi/id/product_name' ]; then

    IFS= read -r MACH_PRODUCT_NAME </sys/devices/virtual/dmi/id/product_name

    B_='' B="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${B_}</span>   ${MACH_PRODUCT_NAME:-?}"

fi

if [ -f '/proc/version' -o -x "$(command -v uname)" ]; then

    IFS= read -r _ _ UNAME_R _ </proc/version

    C_='' C="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${C_}</span>   ${UNAME_R:-$(uname -r)}"

fi

if [ -f '/proc/uptime' -o -x "$(command -v uptime)" ]; then

    IFS='.' read -r S _ </proc/uptime

    D="$((S/60/60/24))"
    H="$((S/60/60%24))"
    M="$((S/60%60))"

    [ "$D" -lt 2 ] || DP='s'
    [ "$H" -lt 2 ] || HP='s'
    [ "$M" -lt 2 ] || MP='s'
    [ "$S" -lt 2 ] || SP='s'

    [ "$D" -eq 0 ] || UPTIME_P="${D} day${DP}, "
    [ "$H" -eq 0 ] || UPTIME_P="${UPTIME_P}${H} hour${HP}, "
    [ "$M" -eq 0 ] || UPTIME_P="${UPTIME_P}${M} minute${MP}"
    [  -n  "$M"  ] || UPTIME_P="${UPTIME_P}${S} second${SP}"

    UPTIME_P="${UPTIME_P:-$(uptime -p)}"

    D_='' D="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${D_}</span>   ${UPTIME_P##*up\ }"

fi

if [ -x "$(command -v xrandr)" ]; then

    XRANDR_CURRENT="$(xrandr --nograb --current | sed -n -e 's|^[ ]*\(.*\)\*.*$|\1|p')" \
    RESOLUTION_RATE="${XRANDR_CURRENT%%\ *} @ ${XRANDR_CURRENT##*\ }Hz"

    E_='' E="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${E_}</span>   ${RESOLUTION_RATE}"

fi

if [ -x "$(command -v df)" ]; then

    DF_L_H="$(df -l -h --output='pcent,fstype' / | sed -n -e 's|%[ ]*.*$|\U&|' \
                                                          -e 's|^[ ]*\([0-9]*%[ ]*.*\)$|\1|p')" \
    FILESYSTEM_INFO="${DF_L_H%%\ *} @ ${DF_L_H##*\ }"

    F_='' F="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${F_}</span>   ${FILESYSTEM_INFO}"

fi

for SYS_MANAGER in apt \
                   emerge \
                   flatpak \
                   kiss \
                   pacman \
                   xbps-query
do
    [ -x "$(command -v "$SYS_MANAGER")" ] && PKG_MANAGER="${PKG_MANAGER} ${SYS_MANAGER}"
done

for MANAGER in ${PKG_MANAGER#\ }; do

    case "$MANAGER" in
        apt       ) GET_PKGS='/var/lib/dpkg/info/*.list'
        ;;
        emerge    ) GET_PKGS='/var/db/pkg/*/*'
        ;;
        flatpak   ) GET_PKGS="$(flatpak --columns=app list)"
        ;;
        kiss      ) GET_PKGS='/var/db/kiss/installed/*'
        ;;
        pacman    ) GET_PKGS='/var/lib/pacman/local/[0-9a-z]*'
        ;;
        xbps-query) GET_PKGS='/var/db/xbps/.*'
        ;;
    esac

    TOTAL_PKGS="$(($(set -- ${GET_PKGS}; echo "${#}") - PKG_XCPT))"

    case "$TOTAL_PKGS" in
        0|1) TOTAL_PKGS='?'
             MANAGER='Unknown'
        ;;
    esac

    PKGS_INFO="${PKGS_INFO}${TOTAL_PKGS} (${MANAGER}), "

done

G_='' G="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${G_}</span>   ${PKGS_INFO%,\ }"

#if [ -x "$(command -v xprop)" ]; then

    #XPROP_NET_SUPPORTING_WM_CHECK="$(xprop -root -notype _NET_SUPPORTING_WM_CHECK)" \
    #XPROP_NET_WM_NAME="$(xprop -id "${XPROP_NET_SUPPORTING_WM_CHECK##*#\ }" -notype _NET_WM_NAME)" \
    #_NET_WM_NAME="${XPROP_NET_WM_NAME#_NET_WM_NAME\ =\ \"}"

    #G_='' G="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${G_}</span>   ${_NET_WM_NAME%\"}"

#fi

MESSAGE='🌸'

printf '%b\n' '\0use-hot-keys\037true' '\0markup-rows\037true' "\0message\037${MESSAGE}"
printf '%s\0nonselectable\037true\n' "$A" "$B" "$C" "$D" "$E" "$F" "$G"

exit ${?}
