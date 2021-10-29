#!/usr/bin/env bash
export LC_ALL=POSIX LANG=POSIX; . "${HOME}/.owl4ce_var"

# Determine `systemd-logind` or `(e)logind`.
if [ -x "$(command -v systemctl)" ]; then
    SEATCTL='systemctl'
elif [ -x "$(command -v loginctl)" ]; then
    SEATCTL='loginctl'
else
    exec "$EXNOTIFY_SEND" -r 1337 -i "${ICON_GLADIENT_DIR}/lock.png" '' '<b>systemd-logind</b> or <b>elogind</b> not installed nor running!'
fi

ROFI="rofi -theme themes/sidebar/five-${CHK_ROFI_MOD}.rasi"

A='' B='' C='' D='' E=''

MENU="$(printf "${A}\n${B}\n${C}\n${D}\n${E}\n" | ${ROFI} -dmenu -selected-row 2)"

case "$MENU" in
    "$A") exec "${ROFI_DIR}/scripts/promptmenu.sh" \
              --yes-command "${SEATCTL} poweroff"  \
              --query '     Poweroff?'
    ;;
    "$B") exec "${ROFI_DIR}/scripts/promptmenu.sh" \
              --yes-command "${SEATCTL} reboot"    \
              --query '      Reboot?'
    ;;
    "$C") exec "$DEFAPPS_EXEC" lockscreen
    ;;
    "$D") if [[ "$("$MUSIC_CONTROLLER" status)" = *'laying'* ]]; then
              "$MUSIC_CONTROLLER" toggle
          fi
          exec "$SEATCTL" suspend
    ;;
    "$E") exec "${ROFI_DIR}/scripts/promptmenu.sh"               \
              --yes-command "pkill -KILL -u $(id -nu || whoami)" \
              --query '      Logout?'
    ;;
esac 

exit ${?}
