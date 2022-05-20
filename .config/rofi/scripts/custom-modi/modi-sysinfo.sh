#!/usr/bin/env sh

# The custom system info modi inside rofi.
# https://github.com/owl4ce/dotfiles

# SPDX-License-Identifier: ISC

# shellcheck disable=SC2166,SC2034,SC2086

export LANG='POSIX'
exec 2>/dev/null

# For the button that launches rofi-main menu via $ROFI_RETV aka return value.
case "$ROFI_RETV" in
    28) LANG="$SYSTEM_LANG" exec "${0%/*}/../rofi-main.sh"
    ;;
esac

# Row icon font name and size.
ROW_ICON_FONT='feather 12'

# Set the status of OS release-name.
if [ -f '/etc/os-release' ]; then

    # Parse $PRETTY_NAME or $NAME.
    . /etc/os-release

    # Main options. #1
    A_='' A="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${A_}</span>   ${PRETTY_NAME:-${NAME}}"

fi

# Set the status of hardware/product name.
if [ -f '/sys/devices/virtual/dmi/id/product_name' ]; then

    # Get hardware/product name from sysfs.
    IFS= read -r MACH_PRODUCT_NAME </sys/devices/virtual/dmi/id/product_name

    # Main options. #2
    B_='' B="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${B_}</span>   ${MACH_PRODUCT_NAME:-?}"

fi

# Set the status of kernel name and/or version.
if [ -f '/proc/version' -o -x "$(command -v uname)" ]; then

    # Get kernel built-information from /proc pseudofs.
    IFS= read -r _ _ UNAME_R _ </proc/version

    # Main options. #3
    C_='' C="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${C_}</span>   ${UNAME_R:-$(uname -r)}"

fi

# Set the status of system-uptime since boot.
if [ -f '/proc/uptime' -o -x "$(command -v uptime)" ]; then

    # Parse system-uptime from /proc pseudofs.
    IFS='.' read -r S _ </proc/uptime

    # Convert uptime into readable value.
    D="$((S/60/60/24))"
    H="$((S/60/60%24))"
    M="$((S/60%60))"

    # Plurals.
    [ "$D" -lt 2 ] || DP='s'
    [ "$H" -lt 2 ] || HP='s'
    [ "$M" -lt 2 ] || MP='s'
    [ "$S" -lt 2 ] || SP='s'

    # Hide empty fields and make the output of uptime smaller.
    [ "$D" -eq 0 ] || UPTIME_P="${D} day${DP}, "
    [ "$H" -eq 0 ] || UPTIME_P="${UPTIME_P}${H} hour${HP}, "
    [ "$M" -eq 0 ] || UPTIME_P="${UPTIME_P}${M} minute${MP}"
    [  -n  "$M"  ] || UPTIME_P="${UPTIME_P}${S} second${SP}"

    # Fallback to `uptime -p` if empty/invalid.
    UPTIME_P="${UPTIME_P:-$(uptime -p)}"

    # Main options. #4
    D_='' D="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${D_}</span>   ${UPTIME_P##*up\ }"

fi

# Set the status of current screen resolution and refresh rate.
if [ -x "$(command -v xrandr)" ]; then

    # Parse current screen information with `xrandr`.
    XRANDR_CURRENT="$(xrandr --nograb --current | sed -n -e 's|^[ ]*\(.*\)\*.*$|\1|p')" \
    RESOLUTION_RATE="${XRANDR_CURRENT%%\ *} @ ${XRANDR_CURRENT##*\ }Hz"

    # Main options. #5
    E_='' E="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${E_}</span>   ${RESOLUTION_RATE}"

fi

# Set the status of storage usage and filesystem name.
if [ -x "$(command -v df)" ]; then

    # Parse filesystem information with `df`.
    DF_L_H="$(df -l -h --output='source,pcent,fstype' | sed -n -e '/\/dev\/root/s|%[ ]*.*$|\U&|' \
                                                               -e 's|^/dev/root[ ]*\(.*\)$|\1|p')" \
    FILESYSTEM_INFO="${DF_L_H%%\ *} @ ${DF_L_H##*\ }"

    # Main options. #6
    F_='' F="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${F_}</span>   ${FILESYSTEM_INFO}"

fi

# Set the status of system-installed package managers.
# Also see "https://github.com/Dyzean/coffee-fetch".

# Verify system-installed package manager.
for SYS_MANAGER in apt \
                   emerge \
                   flatpak \
                   kiss \
                   pacman \
                   xbps-query
do
    [ -x "$(command -v "$SYS_MANAGER")" ] && PKG_MANAGER="${PKG_MANAGER} ${SYS_MANAGER}"
done

# Count installed packages for each package manager.
for MANAGER in ${PKG_MANAGER#\ }; do

    # Get/query installed packages.
    # Note that if the system contains directories of installed packages,
    # it's highly recommended to use glob as `emerge` below. Assign PKG_XCPT
    # to reduce TOTAL_PKGS if any unexpected files are included by globs.
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

    # Count all queried packages.
    TOTAL_PKGS="$(($(set -- ${GET_PKGS}; echo "${#}") - PKG_XCPT))"

    # If only zero or one package is installed,
    # make the package manager looks unrecognized.
    case "$TOTAL_PKGS" in
        0|1) TOTAL_PKGS='?'
             MANAGER='Unknown'
        ;;
    esac

    # Preserve information across package managers.
    PKGS_INFO="${PKGS_INFO}${TOTAL_PKGS} (${MANAGER}), "

done

# Main options. #7
G_='' G="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${G_}</span>   ${PKGS_INFO%,\ }"

# Set the status of active EWMH-compliant window manager.
#if [ -x "$(command -v xprop)" ]; then

    # Parse _NET_WM_NAME with `xprop`.
    #XPROP_NET_SUPPORTING_WM_CHECK="$(xprop -root -notype _NET_SUPPORTING_WM_CHECK)" \
    #XPROP_NET_WM_NAME="$(xprop -id "${XPROP_NET_SUPPORTING_WM_CHECK##*#\ }" -notype _NET_WM_NAME)" \
    #_NET_WM_NAME="${XPROP_NET_WM_NAME#_NET_WM_NAME\ =\ \"}"

    # Main options. #7
    #G_='' G="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${G_}</span>   ${_NET_WM_NAME%\"}"

#fi

# Message to display.
MESSAGE='🌸'

# Display the information via rofi-specific escape sequences.
printf '%b\n' '\0use-hot-keys\037true' '\0markup-rows\037true' "\0message\037${MESSAGE}"
printf '%s\0nonselectable\037true\n' "$A" "$B" "$C" "$D" "$E" "$F" "$G"

exit ${?}
