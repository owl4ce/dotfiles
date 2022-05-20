#!/usr/bin/env sh

# Setup user's preferred terminal emulator.
# https://github.com/owl4ce/dotfiles

export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

PREF_TERM="$(joyd_launch_apps -g terminal)"

[ -x "$(command -v "$PREF_TERM")" ] || exec dunstify "Install \`${PREF_TERM}\`!" -r 80 -u low

if [ "$PREF_TERM" = 'urxvt' -o "$PREF_TERM" = 'urxvtc' ]; then

    FG_BLACK="$(grep -m1 -o '^\*.foreground:[ ]*black0' "$XRESOURCES_CONFIG")"

    case "${1}" in
        '') [ -n "$FG_BLACK" ] && COL1='white' COL2='black' || COL1='black' COL2='white'
        ;;
        r*) [ -n "$FG_BLACK" ] && COL1='black' COL2='white' || COL1='white' COL2='black'

             sed -e '/^\*.foreground:/s|\*|!\*JOY|' \
                 -e '/^\*.background:/s|\*|!\*JOY|' \
                 -e '/^\*.cursorColor:/s|\*|!\*JOY|' \
                 -e '/^\*.borderColor:/s|\*|!\*JOY|' \
                 -e '/^\*.color0:/s|\*|!\*JOY|' \
                 -e '/^\*.color7:/s|\*|!\*JOY|' \
                 -e '/^\*.color8:/s|\*|!\*JOY|' \
                 -e '/^\*.color15:/s|\*|!\*JOY|' \
                 -e '/^!\*.foreground:/s|!||' \
                 -e '/^!\*.background:/s|!||' \
                 -e '/^!\*.cursorColor:/s|!||' \
                 -e '/^!\*.borderColor:/s|!||' \
                 -e '/^!\*.color0:/s|!||' \
                 -e '/^!\*.color7:/s|!||' \
                 -e '/^!\*.color8:/s|!||' \
                 -e '/^!\*.color15:/s|!||' \
                 -e '/^!\*JOY/s|JOY||' \
                 -i "$XRESOURCES_CONFIG"
        ;;
    esac

    [ "${URXVT_OPACITY:-100}" -eq 100 ] || URXVT_DEPTH='32'

    sed -e "/^URxvt.depth:/s|[0-9]*$|${URXVT_DEPTH:-24}|" \
        -e "/^URxvt.iconFile:/s|\(/[^\0]*\)\+/\?$|${TERMINAL_ICON}|" \
        -e "/^URxvt.url-launcher:/s|[^[ ]*]*$|${WEB_BROWSER}|" \
        -e "/^#define[ ]*${COL1}0/s|\[[0-9]*\]#|\[${URXVT_OPACITY:-100}\]#|" \
        -e "/^#define[ ]*${COL2}0/s|\[[0-9]*\]#|\[100\]#|" \
        -i "$XRESOURCES_CONFIG"

    xrdb "$XRESOURCES_CONFIG" &

    URXVT_PIDS="$(pgrep -u "${EUID:-$(id -u)}" urxvt)"

    [ -n "$URXVT_PIDS" ] || exit ${?}

    wait

    XRDB_QUERY="$(xrdb -query)"

    xrdb_query()
    {
        while IFS=';' read -r STRING; do
            case "${STRING%%\	*}" in
                "${1}") echo "${STRING##*\	}"
                        break
                ;;
            esac
        done <<- EOF
			${XRDB_QUERY}
		EOF
    }

    {
        IFS= read -r OSC_SEQ <<- EOF
			$(for QY in foreground \
						background \
						borderColor \
						cursorColor \
						color0 \
						color7 \
						color8 \
						color15
			do

				GET_HEX="$(xrdb_query "*.${QY}:")"

				case "$QY" in
					foreground ) SEQ='10'
					;;
					background ) SEQ='11'
					;;
					borderColor) SEQ='708'
					;;
					cursorColor) SEQ='12'
					;;
					color*[0-9]) SEQ="4;${QY##*[^0-9]}"
					;;
				esac

				printf "\033]${SEQ};${GET_HEX}\007"

			done)
		EOF

        for PID in ${URXVT_PIDS}; do
            for CHILD_PID in $(pgrep -P "$PID"); do
                printf "$OSC_SEQ" >>"/proc/${CHILD_PID}/fd/0"
            done
        done
    } &

else
    dunstify 'Terminal Emulator' "Unsupported <u>${PREF_TERM}</u>!" -i "$TERMINAL_ICON" -r 80 -u low
fi

exit ${?}