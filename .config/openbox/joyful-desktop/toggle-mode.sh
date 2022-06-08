#!/usr/bin/env sh

# Desc:   Toggle or apply theme and/or mode.
# Author: Harry Kurn <alternate-se7en@pm.me>
# URL:    https://github.com/owl4ce/dotfiles/tree/ng/.config/openbox/joyful-desktop/toggle-mode.sh

# SPDX-License-Identifier: ISC

# shellcheck disable=SC3044

SYSTEM_LANG="$LANG"
export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

killall tint2 dunst -q &

# https://gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html#:~:text=expand_aliases
[ -z "$BASH" ] || shopt -s expand_aliases

setup_ui()
{
    sed -e "/^current_theme[ ]*/s|\"[a-z]*\"$|\"${1}\"|" \
        -e "/^current_mode[ ]*/s|\"[a-z]*\"$|\"${2}\"|" \
        -i "$MODE_FILE"

    joyd_theme_set

    JOYD_TERMINAL_SET_ARGS="${3%%_*}" LANG="$SYSTEM_LANG" \
    joyd_user_interface_set

    case "${1}" in
        mech*) BODY='Mechanical Theme'
        ;;
        eyec*) BODY='EyeCandy Theme'
        ;;
    esac

    case "${2}" in
        art*) SUMMARY='Artistic Mode'
        ;;
        int*) SUMMARY='Interactive Mode'
        ;;
    esac

    dunstify "$SUMMARY" "$BODY" -h string:synchronous:toggle-mode \
                                -a joyful_desktop \
                                -i "${GLADIENT_ICON_DIR}/${1}.${2}.png" \
                                -u low
}

case "${1}" in
    '') joyd_tray_programs kill

        for T in mechanical eyecandy; do
            [ "$CHK_THEME" != "$T" ] || continue
            setup_ui "$T" "$CHK_MODE" reverse_terminal_bg_fg
            break
        done

        LANG="$SYSTEM_LANG" joyd_tray_programs exec
    ;;
    m*) for M in artistic interactive; do
            [ "$CHK_MODE" != "$M" ] || continue
            setup_ui "$CHK_THEME" "$M"
            break
        done
    ;;
    a*) LANG="$SYSTEM_LANG" joyd_user_interface_set
    ;;
esac

exit ${?}
