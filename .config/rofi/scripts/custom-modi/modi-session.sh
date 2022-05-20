#!/usr/bin/env sh

# The custom session control modi inside rofi.
# https://github.com/owl4ce/dotfiles

export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

MESSAGE="$(date +%H %M)"

printf "\0message\037${MESSAGE}\n\0markup-rows\037true\n"

ROW_ICON_FONT='feather 12'

A="<span font_desc='${ROW_ICON_FONT}' weight='bold'></span>   Poweroff"
B="<span font_desc='${ROW_ICON_FONT}' weight='bold'></span>   Reboot"
C="<span font_desc='${ROW_ICON_FONT}' weight='bold'></span>   Lock"
D="<span font_desc='${ROW_ICON_FONT}' weight='bold'></span>   Suspend"
E="<span font_desc='${ROW_ICON_FONT}' weight='bold'></span>   Hibernate"
F="<span font_desc='${ROW_ICON_FONT}' weight='bold'></span>   Logout"
Y="<span font_desc='${ROW_ICON_FONT}' weight='bold'></span>   Confirm"
N="<span font_desc='${ROW_ICON_FONT}' weight='bold'></span>   Cancel"

prompt()
{
    printf "\0message\037${1}?\n${Y}\n${N}\n"

    install -m400 /dev/stdin "$ROFI_EXTS_CMD" <<- EOF
		${2}
	EOF

    exit ${?}
}

case "${@}" in
    "$A") prompt "PO" 'loginctl --no-ask-password poweroff'
    ;;
    "$B") prompt "RB" 'loginctl --no-ask-password reboot'
    ;;
    "$C") loginctl --no-ask-password lock-session
          return ${?}
    ;;
    "$D") prompt "SP" 'loginctl --no-ask-password suspend'
    ;;
    "$E") prompt "HN" 'loginctl --no-ask-password hibernate'
    ;;
    "$F") prompt "LO" "loginctl --no-ask-password kill-user ${EUID:-$(id -u)} --signal=SIGKILL"
    ;;
    "$Y") IFS= read -r CMD <"$ROFI_EXTS_CMD"
          eval \${CMD}
    ;;
esac

printf '%b\n' "$A" "$B" "$C" "$D" "$E" "$F"

exit ${?}
