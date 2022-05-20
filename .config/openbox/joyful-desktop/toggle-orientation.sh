#!/usr/bin/env sh

# Toggle UI orientation for Artistic Mode.
# https://github.com/owl4ce/dotfiles

# SPDX-License-Identifier: ISC

# shellcheck disable=SC2166,SC3044

SYSTEM_LANG="$LANG"
export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

# Ensure there's first argument and the current mode is Artistic, to avoid killing the next process.
[ -n "${1}" -a "$CHK_MODE" = 'artistic' ] || exit ${?}

# Kill tint2 and dunst processes first in the background, so they are parallelized (for performance reasons).
killall tint2 dunst -q &

# https://gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html#:~:text=expand_aliases
[ -z "$BASH" ] || shopt -s expand_aliases

# Single-execution options.
case "${1}" in
    l*) # Condition of the direction swapper e.g left/right and top/bottom.
        case "$CHK_PANEL_ORT" in
            vert*) # Left and right switch.
                   if [ "$CHK_PANEL_ORT_V" != 'left' ]; then
                       # Write configuration.
                       sed -e '/^vertical_panel.artistic[ ]*/s|"[a-z]*"$|"left"|' -i "$MODE_FILE"
                       # Execute Openbox margins, dunst, and rofi setup shell-script.
                       joyd_layout_set vertical_left
                       # Synchronize tint2 panel configuration to left.
                       sed -e '/^panel_position[ ]*/s|= center [a-z]* vertical$|= center left vertical|' \
                           -s -i "$TINT2_DIR"/*-'vertical.artistic.tint2rc'
                   elif [ "$CHK_PANEL_ORT_V" != 'right' ]; then
                       # Write configuration.
                       sed -e '/^vertical_panel.artistic[ ]*/s|"[a-z]*"$|"right"|' -i "$MODE_FILE"
                       # Execute Openbox margins, dunst, and rofi setup shell-script.
                       joyd_layout_set vertical_right
                       # Synchronize tint2 panel configuration to right.
                       sed -e '/^panel_position[ ]*/s|= center [a-z]* vertical$|= center right vertical|' \
                           -s -i "$TINT2_DIR"/*-'vertical.artistic.tint2rc'
                   fi
            ;;
            hori*) # Top and bottom switch.
                   if [ "$CHK_PANEL_ORT_H" != 'bottom' ]; then
                       # Write configuration.
                       sed -e '/^horizontal_panel.artistic[ ]*/s|"[a-z]*"$|"bottom"|' -i "$MODE_FILE"
                       # Execute Openbox margins, dunst, and rofi setup shell-script.
                       joyd_layout_set horizontal_bottom
                       # Synchronize tint2 panel configuration to bottom.
                       sed -e '/^panel_position[ ]*/s|= [a-z]* center horizontal$|= bottom center horizontal|' \
                           -s -i "$TINT2_DIR"/*-'horizontal.artistic.tint2rc'
                   elif [ "$CHK_PANEL_ORT_H" != 'top' ]; then
                       # Write configuration.
                       sed -e '/^horizontal_panel.artistic[ ]*/s|"[a-z]*"$|"top"|' -i "$MODE_FILE"
                       # Execute Openbox margins, dunst, and rofi setup shell-script.
                       joyd_layout_set horizontal_top
                       # Synchronize tint2 panel configuration to top.
                       sed -e '/^panel_position[ ]*/s|= [a-z]* center horizontal$|= top center horizontal|' \
                           -s -i "$TINT2_DIR"/*-'horizontal.artistic.tint2rc'
                   fi
            ;;
        esac
    ;;
    v*) # Vertical and horizontal toggler.
        if [ "$CHK_PANEL_ORT" != 'vertical' ]; then
            # Write configuration.
            sed -e '/^panel_orientation.artistic[ ]*/s|"[a-z]*"$|"vertical"|' -i "$MODE_FILE"
            # Execute Openbox margins, dunst, and rofi setup shell-script.
            joyd_layout_set "vertical_${CHK_PANEL_ORT_V}"
            # Synchronize tint2 panel configuration to vertical.
            sed -e "/^panel_position[ ]*/s|= center [a-z]* vertical$|= center ${CHK_PANEL_ORT_V} vertical|" \
                -s -i "$TINT2_DIR"/*-'vertical.artistic.tint2rc'
        elif [ "$CHK_PANEL_ORT" != 'horizontal' ]; then
            # Write configuration.
            sed -e '/^panel_orientation.artistic[ ]*/s|"[a-z]*"$|"horizontal"|' -i "$MODE_FILE"
            # Execute Openbox margins, dunst, and rofi setup shell-script.
            joyd_layout_set "horizontal_${CHK_PANEL_ORT_H}"
            # Synchronize tint2 panel configuration to horizontal.
            sed -e "/^panel_position[ ]*/s|= center [a-z]* horizontal$|= center ${CHK_PANEL_ORT_H} horizontal|" \
                -s -i "$TINT2_DIR"/*-'vertical.artistic.tint2rc'
        fi
    ;;
esac

# Execute UI setup shell-script without reloading the wallpaper.
LANG="$SYSTEM_LANG" joyd_user_interface_set without_wallpaper

exit ${?}
