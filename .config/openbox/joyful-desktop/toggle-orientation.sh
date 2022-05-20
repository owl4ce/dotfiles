#!/usr/bin/env sh

# Toggle UI orientation for Artistic Mode.
# https://github.com/owl4ce/dotfiles

SYSTEM_LANG="$LANG"
export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

[ -n "${1}" -a "$CHK_MODE" = 'artistic' ] || exit ${?}

killall tint2 dunst -q &

case "${1}" in
    l*) case "$CHK_PANEL_ORT" in
            vert*) if [ "$CHK_PANEL_ORT_V" != 'left' ]; then
                       sed -e '/^vertical_panel.artistic[ ]*/s|".*"$|"left"|' -i "$MODE_FILE"
                       joyd_layout_set vertical_left
                       sed -e '/^panel_position[ ]*/s|= center .* vertical$|= center left vertical|' \
                           -s -i "$TINT2_DIR"/*-'vertical.artistic.tint2rc'
                   elif [ "$CHK_PANEL_ORT_V" != 'right' ]; then
                       sed -e '/^vertical_panel.artistic[ ]*/s|".*"$|"right"|' -i "$MODE_FILE"
                       joyd_layout_set vertical_right
                       sed -e '/^panel_position[ ]*/s|= center .* vertical$|= center right vertical|' \
                           -s -i "$TINT2_DIR"/*-'vertical.artistic.tint2rc'
                   fi
            ;;
            hori*) if [ "$CHK_PANEL_ORT_H" != 'bottom' ]; then
                       sed -e '/^horizontal_panel.artistic[ ]*/s|".*"$|"bottom"|' -i "$MODE_FILE"
                       joyd_layout_set horizontal_bottom
                       sed -e '/^panel_position[ ]*/s|= .* center horizontal$|= bottom center horizontal|' \
                           -s -i "$TINT2_DIR"/*-'horizontal.artistic.tint2rc'
                   elif [ "$CHK_PANEL_ORT_H" != 'top' ]; then
                       sed -e '/^horizontal_panel.artistic[ ]*/s|".*"$|"top"|' -i "$MODE_FILE"
                       joyd_layout_set horizontal_top
                       sed -e '/^panel_position[ ]*/s|= .* center horizontal$|= top center horizontal|' \
                           -s -i "$TINT2_DIR"/*-'horizontal.artistic.tint2rc'
                   fi
            ;;
        esac
    ;;
    v*) if [ "$CHK_PANEL_ORT" != 'vertical' ]; then
            sed -e '/^panel_orientation.artistic[ ]*/s|".*"$|"vertical"|' -i "$MODE_FILE"
            joyd_layout_set "vertical_${CHK_PANEL_ORT_V}"
            sed -e "/^panel_position[ ]*/s|= center .* vertical$|= center ${CHK_PANEL_ORT_V} vertical|" \
                -s -i "$TINT2_DIR"/*-'vertical.artistic.tint2rc'
        elif [ "$CHK_PANEL_ORT" != 'horizontal' ]; then
            sed -e '/^panel_orientation.artistic[ ]*/s|".*"$|"horizontal"|' -i "$MODE_FILE"
            joyd_layout_set "horizontal_${CHK_PANEL_ORT_H}"
            sed -e "/^panel_position[ ]*/s|= center .* horizontal$|= center ${CHK_PANEL_ORT_H} horizontal|" \
                -s -i "$TINT2_DIR"/*-'vertical.artistic.tint2rc'
        fi
    ;;
esac

LANG="$SYSTEM_LANG" joyd_user_interface_set without_wallpaper

exit ${?}
