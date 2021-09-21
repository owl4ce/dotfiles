#!/usr/bin/env bash
export LC_ALL=C LANG=C; . "${HOME}/.owl4ce_var"

rofi_command="rofi -theme themes/sidebar/five-${CHK_ROFI_MOD}.rasi"

# Icons.
shutdown="" reboot="" lock="" suspend="" logout=""

# systemd-logind/elogind detection.
if [[ -x "$(command -v systemctl)" ]]; then
    SEATCTL="systemctl"
elif [[ -x "$(command -v loginctl)" ]]; then
    SEATCTL="loginctl"
else
    exec "$EXNOTIFY_SEND" -r 1337 -i "${ICON_GLADIENT_DIR}/lock.png" "" "<b>systemd-logind</b> or <b>elogind</b> not installed nor running!"
fi

# Variable passed to rofi.
options="${shutdown}\n${reboot}\n${lock}\n${suspend}\n${logout}"

# Main.
chosen="$(printf "${options}\n" | ${rofi_command} -dmenu -selected-row 2)"
case "$chosen" in
    "$shutdown") exec "${ROFI_DIR}/scripts/promptmenu.sh" \
                 --yes-command "${SEATCTL} poweroff"      \
                 --query "     Poweroff?"
    ;;
    "$reboot")   exec "${ROFI_DIR}/scripts/promptmenu.sh" \
                 --yes-command "${SEATCTL} reboot"        \
                 --query "      Reboot?"
    ;;
    "$lock")     exec "$DEFAPPS_EXEC" lockscreen
    ;;
    "$suspend")  if [[ "$("$MUSIC_CONTROLLER" status)" = *"laying"* ]]; then
                     "$MUSIC_CONTROLLER" toggle
                 fi; exec "$SEATCTL" suspend
    ;;
    "$logout")   exec "${ROFI_DIR}/scripts/promptmenu.sh"             \
                 --yes-command "pkill -KILL -u $(id -n -u || whoami)" \
                 --query "      Logout?"
    ;;
esac 

unset LC_ALL LANG && exit $?
