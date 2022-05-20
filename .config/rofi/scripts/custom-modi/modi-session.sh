#!/usr/bin/env sh

# The custom session control modi inside rofi.
# https://github.com/owl4ce/dotfiles

export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

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

prompt()
{
    PROMPT="<span font_desc='${MSG_ICON_FONT}' weight='bold'>${1}</span>"

    printf '%b\n' "\0message\037${PROMPT}" "$Y" "$N"

    install -m400 /dev/stdin "$ROFI_EXTS_CMD" -- <<- EOF
		#${2}
	EOF

    exit ${?}
}

case "${@}" in
    "$A") prompt "$A_" 'loginctl --no-ask-password poweroff'
    ;;
    "$B") prompt "$B_" 'loginctl --no-ask-password reboot'
    ;;
    "$C") loginctl --no-ask-password lock-session
          return ${?}
    ;;
    "$D") prompt "$D_" 'loginctl --no-ask-password suspend'
    ;;
    "$E") prompt "$E_" 'loginctl --no-ask-password hibernate'
    ;;
    "$F") prompt "$F_" 'loginctl --no-ask-password kill-user ${EUID:-$(id -u)} --signal=SIGKILL'
    ;;
    "$Y") IFS= read -r CMD <"$ROFI_EXTS_CMD"
          eval ${CMD#\#}
    ;;
esac

MESSAGE="$(date +%H %M)"

printf "\0message\037${MESSAGE}\n\0markup-rows\037true\n"
printf '%b\n' "$A" "$B" "$C" "$D" "$E" "$F"

exit ${?}
