#!/usr/bin/env sh

# Setup UI for each themes and modes.
# https://github.com/owl4ce/dotfiles

# SPDX-License-Identifier: ISC

# shellcheck disable=SC3044

SYSTEM_LANG="$LANG"
export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

# https://gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html#:~:text=expand_aliases
[ -z "$BASH" ] || shopt -s expand_aliases

# Get the variables. No further explanation :P
joyd_cross_variables

# Synchronize Openbox theme of current theme.
sed -e "/^menu.items.active.text.color:/s|[#][0-9a-fA-F]*$|${OBT_IT}|" \
    -e "/^menu.title.text.color:/s|[#][0-9a-fA-F]*$|${OBT_TT}|" \
    -i "${OBT_D}/themerc"

# Reconfigure Openbox in the background, so it's parallelized (for performance reasons).
openbox --reconfigure &

# Synchronize rofi configuration of current theme.
sed -e "/^[ ]*accent1:/s|[#][0-9a-fA-F]*;$|${ROFI_A1};|" \
    -e "/^[ ]*accent2:/s|[#][0-9a-fA-F]*;$|${ROFI_A2};|" \
    -e "/^[ ]*button-gradient:/s|([0-9]*, [#][0-9a-fA-F]*, [#][0-9a-fA-F]*)|(90, ${ROFI_A1}, ${ROFI_A2})|" \
    -e "/^[ ]*background-alpha:/s|[0-9a-fA-F]\{2\}\b;$|$(printf '%x\n' "$((${ROFI_OPACITY:-100}*255/100))");|" \
    -i "${ROFI_COLORSCHEMES_DIR}/${CHK_THEME}.rasi"

# Synchronize all dunst configurations.
sed -e "/^transparency[ ]*/s|[0-9]*$|$((100-${DUNST_OPACITY:-100}))|" \
    -e "/^browser[ ]*/s|\".*\"$|\"${WEB_BROWSER}\"|" \
    -s -i "$DUNST_DIR"/*.*.'dunstrc'

# Synchronize dunst configuration of current theme and mode.
sed -e "/^format[ ]*/s|foreground='[#][0-9a-fA-F]*'|foreground='${DUNST_FG}'|" \
    -e "/^highlight[ ]*/s|\"[#][0-9a-fA-F]*\"$|\"${DUNST_PB}\"|" \
    -i "${DUNST_DIR}/${CHK_THEME}.${CHK_MODE}.dunstrc"

# Execute dunst notification daemon of current theme and mode in the background.
LANG="$SYSTEM_LANG" dunst -config "${DUNST_DIR}/${CHK_THEME}.${CHK_MODE}.dunstrc" &

# Execute terminal setup shell-script in the background, so it's parallelized (for performance reasons).
joyd_terminal_set "$JOYD_TERMINAL_SET_ARGS" &

# Avoid $JOYD_TERMINAL_SET_ARGS being preserved universally.
unset JOYD_TERMINAL_SET_ARGS

# Set X wallpaper if no option is specified.
[ -n "${1}" ] || nitrogen --force-setter=xwindows --set-zoom-fill --save "${CHK_WALLPAPER_DIR}/${CHK_WALLPAPER}"

# Execute the tint2 panel in the background conditionally.
{
    case "$CHK_MODE" in
        art*) # Synchronize tint2 panel configuration for Artistic Mode of current theme.
              sed -e "/^start_color[ ]*/s|= START_COLOR |= ${TINT2_G1} |" \
                  -e "/^end_color[ ]*/s|= END_COLOR |= ${TINT2_G2} |" \
                  -e "/^button_text[ ]*/s|= ⟐$|= ${TINT2_SB}|" \
                  -s -i "${TINT2_DIR}/${CHK_THEME}"-*.'artistic.tint2rc'

              # Execute tint2 panel for Artistic Mode of current theme and panel orientation.
              LANG="$SYSTEM_LANG" tint2 -c "${TINT2_DIR}/${CHK_THEME}-${CHK_PANEL_ORT}.artistic.tint2rc"

              # Rollback tint2 panel configuration for Artistic Mode of current theme.
              sed -e "/^start_color[ ]*/s|= ${TINT2_G1} |= START_COLOR |" \
                  -e "/^end_color[ ]*/s|= ${TINT2_G2} |= END_COLOR |" \
                  -e "/^button_text[ ]*/s|= ${TINT2_SB}$|= ⟐|" \
                  -s -i "${TINT2_DIR}/${CHK_THEME}"-*.'artistic.tint2rc'
        ;;
        int*) # Execute tint2 panel for Interactive Mode of current theme.
              LANG="$SYSTEM_LANG" tint2 -c "${TINT2_DIR}/${CHK_THEME}-top.interactive.tint2rc"
        ;;
    esac
} &

exit ${?}
