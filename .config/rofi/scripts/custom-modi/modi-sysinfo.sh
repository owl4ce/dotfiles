#!/usr/bin/env sh

# The custom system info modi inside rofi.
# https://github.com/owl4ce/dotfiles

# shellcheck disable=SC2166,SC2034

export LANG='POSIX'
exec 2>/dev/null

ROW_ICON_FONT='feather 12'

if [ -f '/etc/os-release' ]; then
    . /etc/os-release

    A_='' A="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${A_}</span>   ${PRETTY_NAME:-${NAME}}"
fi

if [ -f '/sys/devices/virtual/dmi/id/product_name' ]; then
    read -r PRODUCT_NAME </sys/devices/virtual/dmi/id/product_name

    B_='' B="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${B_}</span>   ${PRODUCT_NAME}"
fi

if [ -f '/proc/version' -o -x "$(command -v uname)" ]; then
    read -r VERSION </proc/version

    VERSION="${VERSION%%\ (*}" \
    VERSION="${VERSION##*version\ }"

    C_='' C="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${C_}</span>   ${VERSION:-$(uname -r)}"
fi

if [ -x "$(command -v uptime)" ]; then
    UPTIME="$(uptime  -p)"

    D_='' D="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${D_}</span>   ${UPTIME##up\ }"
fi

if [ -x "$(command -v xrandr)" ]; then
    XRANDR_CURRENT="$(xrandr --nograb --current | sed -n -e 's|^[ ]*\(.*\)\*.*$|\1|p')" \
    RES_REF_RATE="${XRANDR_CURRENT%%\ *} @ ${XRANDR_CURRENT##*\ }Hz"

    E_='' E="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${E_}</span>   ${RES_REF_RATE}"
fi

if [ -x "$(command -v df)" ]; then
    DF_DEV_ROOT="$(df -l -h --output='source,pcent,fstype' | sed -n -e '/\/dev\/root/s|%[ ]*.*$|\U&|' \
                                                                    -e 's|^/dev/root[ ]*\(.*\)$|\1|p')" \
    FS_DISK_INFO="${DF_DEV_ROOT%%\ *} @ ${DF_DEV_ROOT##*\ }"

    F_='' F="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${F_}</span>   ${FS_DISK_INFO}"
fi

if [ -x "$(command -v xprop)" ]; then
    XPROP_ID="$(xprop -root -notype _NET_SUPPORTING_WM_CHECK)" \
    XPROP_WM="$(xprop -id "${XPROP_ID##*#\ }" -notype _NET_WM_NAME)" \
    ACT_NET_WM_NAME="${XPROP_WM##_NET_WM_NAME\ =\ \"}"

    G_='' G="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${G_}</span>   ${ACT_NET_WM_NAME%%\"*}"
fi

case "$ROFI_RETV" in
    28) LANG="$SYSTEM_LANG" "${0%/*}/../rofi-main.sh"
        return ${?}
    ;;
esac

MESSAGE='^•ᴥ•^'

printf '%b\n' "\0use-hot-keys\037true" "\0markup-rows\037true" "\0message\037${MESSAGE}"
printf '%b\0nonselectable\037true\n' "$A" "$B" "$C" "$D" "$E" "$F" "$G"

exit ${?}
