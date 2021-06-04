#!/usr/bin/env bash
LC_ALL=C LANG=C; source $HOME/.owl4ce_var

rofi_command="rofi -theme themes/sidebar/five-$CHK_ROFI_MOD.rasi"

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""

# LoginD/ELoginD detection
if type -p "systemctl" &> /dev/null; then
    SEATCTL="systemctl"
elif type -p "loginctl" &> /dev/null; then
    SEATCTL="loginctl"
fi

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(printf "$options\n" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $shutdown)  exec $ROFI_DIR/scripts/promptmenu.sh --yes-command "$SEATCTL poweroff" --query "     Poweroff?"
    ;;
    $reboot)    exec $ROFI_DIR/scripts/promptmenu.sh --yes-command "$SEATCTL reboot" --query "      Reboot?"
    ;;
    $lock)      exec $DEFAPPS_EXEC lockscreen
    ;;
    $suspend)   [[ "$($MUSIC_CONTROLLER status)" = *"laying"* ]] && $MUSIC_CONTROLLER toggle; exec "$SEATCTL" suspend
    ;;
    $logout)    exec $ROFI_DIR/scripts/promptmenu.sh --yes-command "pkill -KILL -u $(whoami)" --query "      Logout?"
    ;;
esac 

exit $?
