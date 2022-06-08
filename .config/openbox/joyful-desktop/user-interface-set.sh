#!/usr/bin/env sh

# Desc:   Set-up UI for each themes and modes.
# Author: Harry Kurn <alternate-se7en@pm.me>
# URL:    https://github.com/owl4ce/dotfiles/tree/ng/.config/openbox/joyful-desktop/user-interface-set.sh

# SPDX-License-Identifier: ISC

# shellcheck disable=SC3044

SYSTEM_LANG="$LANG"
export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

# https://gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html#:~:text=expand_aliases
[ -z "$BASH" ] || shopt -s expand_aliases

joyd_cross_variables

sed -e "/^menu.items.active.text.color:/s|[#][0-9a-fA-F]*$|${OBT_IT}|" \
    -e "/^menu.title.text.color:/s|[#][0-9a-fA-F]*$|${OBT_TT}|" \
    -i "${OBT_D}/themerc"

openbox --reconfigure &

sed -e "/^[ ]*accent1:/s|[#][0-9a-fA-F]*;$|${ROFI_A1};|" \
    -e "/^[ ]*accent2:/s|[#][0-9a-fA-F]*;$|${ROFI_A2};|" \
    -e "/^[ ]*button-gradient:/s|([0-9]*, [#][0-9a-fA-F]*, [#][0-9a-fA-F]*)|(90, ${ROFI_A1}, ${ROFI_A2})|" \
    -e "/^[ ]*background-alpha:/s|[0-9a-fA-F]\{2\}\b;$|$(printf '%x\n' "$((${ROFI_OPACITY:-100}*255/100))");|" \
    -i "${ROFI_COLORSCHEMES_DIR}/${CHK_THEME}.rasi"

sed -e "/^transparency[ ]*/s|[0-9]*$|$((100-${DUNST_OPACITY:-100}))|" \
    -e "/^browser[ ]*/s|\".*\"$|\"${WEB_BROWSER}\"|" \
    -s -i "$DUNST_DIR"/*.*.'dunstrc'

sed -e "/^format[ ]*/s|foreground='[#][0-9a-fA-F]*'|foreground='${DUNST_FG}'|" \
    -e "/^highlight[ ]*/s|\"[#][0-9a-fA-F]*\"$|\"${DUNST_PB}\"|" \
    -i "${DUNST_DIR}/${CHK_THEME}.${CHK_MODE}.dunstrc"

LANG="$SYSTEM_LANG" dunst -config "${DUNST_DIR}/${CHK_THEME}.${CHK_MODE}.dunstrc" &

joyd_terminal_set "$JOYD_TERMINAL_SET_ARGS" &

unset JOYD_TERMINAL_SET_ARGS

[ -n "${1}" ] || nitrogen --force-setter=xwindows --set-zoom-fill --save "${CHK_WALLPAPER_DIR}/${CHK_WALLPAPER}"

{
    case "$CHK_MODE" in
        art*) sed -e "/^start_color[ ]*/s|= START_COLOR |= ${TINT2_G1} |" \
                  -e "/^end_color[ ]*/s|= END_COLOR |= ${TINT2_G2} |" \
                  -e "/^button_text[ ]*/s|= ⟐$|= ${TINT2_SB}|" \
                  -s -i "${TINT2_DIR}/${CHK_THEME}"-*.'artistic.tint2rc'

              LANG="$SYSTEM_LANG" tint2 -c "${TINT2_DIR}/${CHK_THEME}-${CHK_PANEL_ORT}.artistic.tint2rc"

              sed -e "/^start_color[ ]*/s|= ${TINT2_G1} |= START_COLOR |" \
                  -e "/^end_color[ ]*/s|= ${TINT2_G2} |= END_COLOR |" \
                  -e "/^button_text[ ]*/s|= ${TINT2_SB}$|= ⟐|" \
                  -s -i "${TINT2_DIR}/${CHK_THEME}"-*.'artistic.tint2rc'
        ;;
        int*) LANG="$SYSTEM_LANG" tint2 -c "${TINT2_DIR}/${CHK_THEME}-top.interactive.tint2rc"
        ;;
    esac
} &

exit ${?}
