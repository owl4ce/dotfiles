#!/usr/bin/env sh

# Toggle or apply theme and/or mode.
# https://github.com/owl4ce/dotfiles

# SPDX-License-Identifier: ISC

# shellcheck disable=SC3044

SYSTEM_LANG="$LANG"
export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

# Kill tint2 and dunst processes first in the background, so they are parallelized (for performance reasons).
killall tint2 dunst -q &

# https://gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html#:~:text=expand_aliases
[ -z "$BASH" ] || shopt -s expand_aliases

# Set-up user interface.
setup_ui()
{
    # Write configuration immediately.
    sed -e "/^current_theme[ ]*/s|\"[a-z]*\"$|\"${1}\"|" \
        -e "/^current_mode[ ]*/s|\"[a-z]*\"$|\"${2}\"|" \
        -i "$MODE_FILE"

    # Execute theme setup shell-script.
    joyd_theme_set

    # Execute UI setup shell-script.
    JOYD_TERMINAL_SET_ARGS="${3%%_*}" LANG="$SYSTEM_LANG" \
    joyd_user_interface_set

    # Dunst's BODY condition.
    case "${1}" in
        mech*) BODY='Mechanical Theme'
        ;;
        eyec*) BODY='EyeCandy Theme'
        ;;
    esac

    # Dunst's SUMMARY condition.
    case "${2}" in
        art*) SUMMARY='Artistic Mode'
        ;;
        int*) SUMMARY='Interactive Mode'
        ;;
    esac

    # Send successful notification.
    dunstify "$SUMMARY" "$BODY" -h string:synchronous:toggle-mode \
                                -a joyful_desktop \
                                -i "${GLADIENT_ICON_DIR}/${1}.${2}.png" \
                                -u low
}

# Single-execution options.
case "${1}" in
    '') # Kill all defined tray programs.
        joyd_tray_programs kill

        # Switch to one of two supported themes.
        for T in mechanical eyecandy; do
            [ "$CHK_THEME" != "$T" ] || continue
            setup_ui "$T" "$CHK_MODE" reverse_terminal_bg_fg
            break
        done

        # Execute all defined tray programs.
        LANG="$SYSTEM_LANG" joyd_tray_programs exec
    ;;
    m*) # Switch to one of two supported modes.
        for M in artistic interactive; do
            [ "$CHK_MODE" != "$M" ] || continue
            setup_ui "$CHK_THEME" "$M"
            break
        done
    ;;
    a*) # Execute UI setup shell-script.
        LANG="$SYSTEM_LANG" joyd_user_interface_set
    ;;
esac

exit ${?}
