#!/usr/bin/env sh

# Desc:   Toggle UI orientation for Artistic Mode.
# Author: Harry Kurn <alternate-se7en@pm.me>
# URL:    https://github.com/owl4ce/dotfiles/tree/ng/.config/openbox/joyful-desktop/toggle-orientation.sh

# SPDX-License-Identifier: ISC

# shellcheck disable=SC2166,SC3044

SYSTEM_LANG="$LANG"
export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

[ -n "${1}" -a "$CHK_MODE" = 'artistic' ] || exit ${?}

killall tint2 dunst -q &

# https://gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html#:~:text=expand_aliases
[ -z "$BASH" ] || shopt -s expand_aliases

case "${1}" in
    l*) case "$CHK_PANEL_ORT" in
            vert*) if [ "$CHK_PANEL_ORT_V" != 'left' ]; then
                       sed -e '/^vertical_panel.artistic[ ]*/s|"[a-z]*"$|"left"|' -i "$MODE_FILE"
                       joyd_layout_set vertical_left
                       sed -e '/^panel_position[ ]*/s|= center [a-z]* vertical$|= center left vertical|' \
                           -s -i "$TINT2_DIR"/*-'vertical.artistic.tint2rc'
                   elif [ "$CHK_PANEL_ORT_V" != 'right' ]; then
                       sed -e '/^vertical_panel.artistic[ ]*/s|"[a-z]*"$|"right"|' -i "$MODE_FILE"
                       joyd_layout_set vertical_right
                       sed -e '/^panel_position[ ]*/s|= center [a-z]* vertical$|= center right vertical|' \
                           -s -i "$TINT2_DIR"/*-'vertical.artistic.tint2rc'
                   fi
            ;;
            hori*) if [ "$CHK_PANEL_ORT_H" != 'bottom' ]; then
                       sed -e '/^horizontal_panel.artistic[ ]*/s|"[a-z]*"$|"bottom"|' -i "$MODE_FILE"
                       joyd_layout_set horizontal_bottom
                       sed -e '/^panel_position[ ]*/s|= [a-z]* center horizontal$|= bottom center horizontal|' \
                           -s -i "$TINT2_DIR"/*-'horizontal.artistic.tint2rc'
                   elif [ "$CHK_PANEL_ORT_H" != 'top' ]; then
                       sed -e '/^horizontal_panel.artistic[ ]*/s|"[a-z]*"$|"top"|' -i "$MODE_FILE"
                       joyd_layout_set horizontal_top
                       sed -e '/^panel_position[ ]*/s|= [a-z]* center horizontal$|= top center horizontal|' \
                           -s -i "$TINT2_DIR"/*-'horizontal.artistic.tint2rc'
                   fi
            ;;
        esac
    ;;
    v*) if [ "$CHK_PANEL_ORT" != 'vertical' ]; then
            sed -e '/^panel_orientation.artistic[ ]*/s|"[a-z]*"$|"vertical"|' -i "$MODE_FILE"
            joyd_layout_set "vertical_${CHK_PANEL_ORT_V}"
            sed -e "/^panel_position[ ]*/s|= center [a-z]* vertical$|= center ${CHK_PANEL_ORT_V} vertical|" \
                -s -i "$TINT2_DIR"/*-'vertical.artistic.tint2rc'
        elif [ "$CHK_PANEL_ORT" != 'horizontal' ]; then
            sed -e '/^panel_orientation.artistic[ ]*/s|"[a-z]*"$|"horizontal"|' -i "$MODE_FILE"
            joyd_layout_set "horizontal_${CHK_PANEL_ORT_H}"
            sed -e "/^panel_position[ ]*/s|= center [a-z]* horizontal$|= center ${CHK_PANEL_ORT_H} horizontal|" \
                -s -i "$TINT2_DIR"/*-'vertical.artistic.tint2rc'
        fi
    ;;
esac

LANG="$SYSTEM_LANG" joyd_user_interface_set without_wallpaper

exit ${?}
