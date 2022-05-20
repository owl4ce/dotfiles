#!/usr/bin/env sh

# Setup user's preferred terminal emulator.
# https://github.com/owl4ce/dotfiles

# SPDX-License-Identifier: ISC

# shellcheck disable=SC3044,SC2166,SC3028

export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

# https://gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html#:~:text=expand_aliases
[ -z "$BASH" ] || shopt -s expand_aliases

# Get the current user's terminal emulator.
PREF_TERM="$(joyd_launch_apps -g terminal)"

# Ensure the current user's terminal emulator already installed for safety and performance reasons.
[ -x "$(command -v "${PREF_TERM%%\ *}")" ] || exec dunstify "Install \`${PREF_TERM%%\ *}\`!" \
                                                            -h string:synchronous:install-deps \
                                                            -a joyful_desktop \
                                                            -u low

# Currently only supports URxvt.
if [ "${PREF_TERM%%\ *}" = 'urxvt' -o "${PREF_TERM%%\ *}" = 'urxvtc' ]; then

    # Get black foreground from X resource database.
    FG_BLACK="$(grep -m1 -o '^\*.foreground:[ ]*black0' "$XRESOURCES_CONFIG")"

    # Single-execution options.
    case "${1}" in
        '') [ -n "$FG_BLACK" ] && COL1='white' COL2='black' || COL1='black' COL2='white'
        ;;
        r*) [ -n "$FG_BLACK" ] && COL1='black' COL2='white' || COL1='white' COL2='black'

            # Reverse the specified color configuration.
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

    # Set the depth to 32 if the opacity is lower than 100.
    [ "${URXVT_OPACITY:-100}" -eq 100 ] || URXVT_DEPTH='32'

    # Synchronize X resource database.
    sed -e "/^URxvt.depth:/s|[0-9]*$|${URXVT_DEPTH:-24}|" \
        -e "/^URxvt.iconFile:/s|\(/[^\0]*\)\+/\?$|${TERMINAL_ICON}|" \
        -e "/^URxvt.url-launcher:/s|[^[ ]*]*$|${WEB_BROWSER}|" \
        -e "/^#define[ ]*${COL1}0/s|\[[0-9]*\]#|\[${URXVT_OPACITY:-100}\]#|" \
        -e "/^#define[ ]*${COL2}0/s|\[[0-9]*\]#|\[100\]#|" \
        -i "$XRESOURCES_CONFIG"

    # Reload the X resource database in the background, so it's parallelized (for performance reasons).
    xrdb "$XRESOURCES_CONFIG" &

    # Get available PIDs of running URxvt.
    URXVT_PIDS="$(pgrep -u "${EUID:-$(id -u)}" urxvt)"

    # Ensure there's URxvt PID.
    [ -n "$URXVT_PIDS" ] || exit ${?}

    # Ensure all background tasks of the current process have been completed.
    wait

    # Query loaded X resource database.
    XRDB_QUERY="$(xrdb -query)"

    # Loaded X resource database parser.
    xrdb_query()
    {
        while IFS=';' read -r STRING; do
            case "${STRING%%\	*}" in
                "${1}") echo "${STRING##*\	}"
                        break
                ;;
            esac
        done <<- XRDB
			${XRDB_QUERY}
		XRDB
    }

    # Format OSC sequences and write to file descriptors in the background,
    # so they are parallelized (for performance reasons).
    {
        # Format the URxvt extensions of the xterm OSC sequences.
        IFS= read -r OSC_SEQ <<- SEQ
			$(for QY in foreground \
						background \
						borderColor \
						cursorColor \
						color0 \
						color7 \
						color8 \
						color15
			do

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

				printf '\033]%s;%s\007' "$SEQ" "$(xrdb_query "*.${QY}:")"

			done)
		SEQ

        # Write to file descriptor for each child process of the available URxvt processes.
        for PID in ${URXVT_PIDS}; do
            for CHILD_PID in $(pgrep -P "$PID"); do
                printf '%s' "$OSC_SEQ" >>"/proc/${CHILD_PID}/fd/0"
            done
        done
    } &

else

    # Send fails notification.
    dunstify 'Terminal Emulator' "Unsupported <u>${PREF_TERM%%\ *}</u>!" -h string:synchronous:terminal-set \
                                                                         -a joyful_desktop \
                                                                         -i "$TERMINAL_ICON" \
                                                                         -u low

fi

exit ${?}
