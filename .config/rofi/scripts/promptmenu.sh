#!/usr/bin/env bash

rofi_command="rofi -theme themes/promptmenu.rasi"

# Options
yes_text="• Confirm"
no_text="• Cancel"
query="Are you sure?"
# Parse the args
if [[ $# -eq 0 ]]; then
    echo -e "Usage: \e[100m \e[32mpromptmenu\e[39;100m -y <command> \e[0m"
    echo -e "All the options:\n" \
        "\e[34mOPTIONNAL \e[39;100m [ -o | --yes-text ] <text> \e[0m\n" \
        "\e[34mOPTIONNAL \e[39;100m [ -c | --no-text ] <text> \e[0m\n" \
        "\e[35mREQUIRED  \e[39;100m [ -y | --yes-command ] <command> \e[0m\n" \
        "\e[34mOPTIONNAL \e[39;100m [ -n | --no-command ] <command> \e[0m\n" \
        "\e[34mOPTIONNAL \e[39;100m [ -q | --query ] txt \e[0m"
    exit 1
else
    while [ $# -ne 0 ]; do
        case "$1" in
            -o | --yes-text) # Optionnal
                [ -n "$2" ] && yes_text="$2" || yes_text=""
                shift
                ;;
            -c | --no-text) # Optionnal
                [ -n "$2" ] && no_text="$2" || no_text=""
                shift
                ;;
            -y | --yes-command) # Required
                [ -n "$2" ] && yes_command="$2"
                shift
                ;;
            -n | --no-command) # Optionnal
                [ -n "$2" ] && no_command="$2"
                shift
                ;;
            -q | --query) # Optionnal
                [ -n "$2" ] && query="$2"
                shift
                ;;
        esac
        shift
    done
fi
# Variable passed to rofi
options="$yes_text\n$no_text"

chosen="$(echo -e "$options" | $rofi_command -p "$query" -dmenu -a 0 -u 1 -selected-row 1)"
case $chosen in
    $yes_text)
        eval "$yes_command"
        ;;
    $no_text)
        eval "$no_command"
        ;;
esac

