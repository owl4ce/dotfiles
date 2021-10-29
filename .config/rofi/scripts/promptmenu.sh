#!/usr/bin/env bash
export LC_ALL=POSIX LANG=POSIX

ROFI='rofi -theme themes/promptmenu.rasi'

yes_text='' no_text='' query='Are you sure?'

if [ ${#} -eq 0 ]; then
    printf "Usage: \e[100m \e[32mpromptmenu\e[39;100m -y <command> \e[0m\n"
    printf "All the options:                                            \n\
    \e[34mOPTIONAL \e[39;100m [ -o | --yes-text ] <text> \e[0m          \n\
    \e[34mOPTIONAL \e[39;100m [ -c | --no-text ] <text> \e[0m           \n\
    \e[35mREQUIRED \e[39;100m [ -y | --yes-command ] <command> \e[0m    \n\
    \e[34mOPTIONAL \e[39;100m [ -n | --no-command ] <command> \e[0m     \n\
    \e[34mOPTIONAL \e[39;100m [ -q | --query ] txt \e[0m                \n"
    exit 1
else
    while [ ${#} -ne 0 ]; do
        case ${1} in
            -o|--yes-text)    if [ -n "$2" ]; then
                                  yes_text="$2"
                              else
                                  yes_text=""
                              fi; shift
            ;;
            -c|--no-text)     if [ -n "$2" ]; then
                                  no_text="$2"
                              else
                                  no_text=""
                              fi; shift
            ;;
            -y|--yes-command) if [ -n "$2" ]; then
                                  yes_command="$2"
                              fi; shift
            ;;
            -n|--no-command)  if [ -n "$2" ]; then
                                  no_command="$2"
                              fi; shift
            ;;
            -q|--query)       if [ -n "$2" ]; then
                                  query="$2"
                              fi; shift
            ;;
        esac
        shift
    done
fi

MENU="$(printf "${yes_text}\n${no_text}\n" | ${ROFI} -p "$query" -dmenu -selected-row 1)"

case "$MENU" in
    "$yes_text") eval "$yes_command"
    ;;
    "$no_text")  eval "$no_command"
    ;;
esac 

exit ${?}
