#!/usr/bin/env sh

# Toggle or apply theme and/or mode.
# https://github.com/owl4ce/dotfiles

SYSTEM_LANG="$LANG"
export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

killall tint2 dunst -q &

setup_ui()
{
    sed -e "/^current_theme[ ]*/s|\".*\"$|\"${1}\"|" \
        -e "/^current_mode[ ]*/s|\".*\"$|\"${2}\"|" \
        -i "$MODE_FILE"

    joyd_theme_set

    LANG="$SYSTEM_LANG" joyd_user_interface_set

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

    dunstify "$SUMMARY" "$BODY" -i "${GLADIENT_ICON_DIR}/${1}.${2}.png" -h string:synchronous:toggle-mode \
                                                                        -u low
}

case "${1}" in
    '') joyd_tray_programs kill

        for T in mechanical eyecandy; do
            [ "$CHK_THEME" != "$T" ] || continue
            setup_ui "$T" "$CHK_MODE"
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
