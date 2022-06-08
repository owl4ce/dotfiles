#!/usr/bin/env sh

# Desc:   Set-up Openbox margin, dunst, and rofi.
# Author: Harry Kurn <alternate-se7en@pm.me>
# URL:    https://github.com/owl4ce/dotfiles/tree/ng/.config/openbox/joyful-desktop/layout-set.sh

# SPDX-License-Identifier: ISC

export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

case "$CHK_MODE" in
    art*) case "${1}" in
              vert*_l*) sed -e '/^origin[ ]*/s|[^[ ]*]*$|top-right|' \
                            -e '/^offset[ ]*/s|[^[ ]*]*$|25x50|' \
                            -s -i "$DUNST_DIR"/*.'artistic.dunstrc'
                        sed -e '/^[ ]*exts-window-height/s|:[ ]*.*;$|:               100%;|' \
                            -e '/^[ ]*exts-window-location/s|:[ ]*.*;$|:             east;|' \
                            -e '/^[ ]*exts-window-x-offset/s|:[ ]*.*;$|:             0px;|' \
                            -e '/^[ ]*exts-window-y-offset/s|:[ ]*.*;$|:             0px;|' \
                            -e '/^[ ]*exts-window-border-radius/s|:[ ]*.*;$|:        0px 0px 0px 0px;|' \
                            -e '/^[ ]*exts-message-border-radius/s|:[ ]*.*;$|:       8px 8px 8px 8px;|' \
                            -i "$ROFI_SHARED_CONFIG"
                        sed -e "/^[ ]*<top>/s|>[0-9]*<|>${OB_MARGIN}<|" \
                            -e "/^[ ]*<bottom>/s|>[0-9]*<|>${OB_MARGIN}<|" \
                            -e "/^[ ]*<left>/s|>[0-9]*<|>$((45+OB_MARGIN))<|" \
                            -e "/^[ ]*<right>/s|>[0-9]*<|>${OB_MARGIN}<|" \
                            -i "$OB_CONFIG"
              ;;
              vert*_r*) sed -e '/^origin[ ]*/s|[^[ ]*]*$|top-left|' \
                            -e '/^offset[ ]*/s|[^[ ]*]*$|25x50|' \
                            -s -i "$DUNST_DIR"/*.'artistic.dunstrc'
                        sed -e '/^[ ]*exts-window-height/s|:[ ]*.*;$|:               100%;|' \
                            -e '/^[ ]*exts-window-location/s|:[ ]*.*;$|:             west;|' \
                            -e '/^[ ]*exts-window-x-offset/s|:[ ]*.*;$|:             0px;|' \
                            -e '/^[ ]*exts-window-y-offset/s|:[ ]*.*;$|:             0px;|' \
                            -e '/^[ ]*exts-window-border-radius/s|:[ ]*.*;$|:        0px 0px 0px 0px;|' \
                            -e '/^[ ]*exts-message-border-radius/s|:[ ]*.*;$|:       8px 8px 8px 8px;|' \
                            -i "$ROFI_SHARED_CONFIG"
                        sed -e "/^[ ]*<top>/s|>[0-9]*<|>${OB_MARGIN}<|" \
                            -e "/^[ ]*<bottom>/s|>[0-9]*<|>${OB_MARGIN}<|" \
                            -e "/^[ ]*<left>/s|>[0-9]*<|>${OB_MARGIN}<|" \
                            -e "/^[ ]*<right>/s|>[0-9]*<|>$((45+OB_MARGIN))<|" \
                            -i "$OB_CONFIG"
              ;;
              hori*_t*) sed -e '/^origin[ ]*/s|[^[ ]*]*$|bottom-right|' \
                            -e '/^offset[ ]*/s|[^[ ]*]*$|25x25|' \
                            -s -i "$DUNST_DIR"/*.'artistic.dunstrc'
                        sed -e '/^[ ]*exts-window-height/s|:[ ]*.*;$|:               89.5%;|' \
                            -e '/^[ ]*exts-window-location/s|:[ ]*.*;$|:             south east;|' \
                            -e '/^[ ]*exts-window-x-offset/s|:[ ]*.*;$|:             0px;|' \
                            -e '/^[ ]*exts-window-y-offset/s|:[ ]*.*;$|:             0px;|' \
                            -e '/^[ ]*exts-window-border-radius/s|:[ ]*.*;$|:        60px 0px 0px 0px;|' \
                            -e '/^[ ]*exts-message-border-radius/s|:[ ]*.*;$|:       45px 8px 8px 8px;|' \
                            -i "$ROFI_SHARED_CONFIG"
                        sed -e "/^[ ]*<top>/s|>[0-9]*<|>$((45+OB_MARGIN))<|" \
                            -e "/^[ ]*<bottom>/s|>[0-9]*<|>${OB_MARGIN}<|" \
                            -e "/^[ ]*<left>/s|>[0-9]*<|>${OB_MARGIN}<|" \
                            -e "/^[ ]*<right>/s|>[0-9]*<|>${OB_MARGIN}<|" \
                            -i "$OB_CONFIG"
              ;;
              hori*_b*) sed -e '/^origin[ ]*/s|[^[ ]*]*$|top-right|' \
                            -e '/^offset[ ]*/s|[^[ ]*]*$|25x50|' \
                            -s -i "$DUNST_DIR"/*.'artistic.dunstrc'
                        sed -e '/^[ ]*exts-window-height/s|:[ ]*.*;$|:               89.5%;|' \
                            -e '/^[ ]*exts-window-location/s|:[ ]*.*;$|:             south east;|' \
                            -e '/^[ ]*exts-window-x-offset/s|:[ ]*.*;$|:             0px;|' \
                            -e '/^[ ]*exts-window-y-offset/s|:[ ]*.*;$|:             -45px;|' \
                            -e '/^[ ]*exts-window-border-radius/s|:[ ]*.*;$|:        60px 0px 0px 0px;|' \
                            -e '/^[ ]*exts-message-border-radius/s|:[ ]*.*;$|:       45px 8px 8px 8px;|' \
                            -i "$ROFI_SHARED_CONFIG"
                        sed -e "/^[ ]*<top>/s|>[0-9]*<|>${OB_MARGIN}<|" \
                            -e "/^[ ]*<bottom>/s|>[0-9]*<|>$((45+OB_MARGIN))<|" \
                            -e "/^[ ]*<left>/s|>[0-9]*<|>${OB_MARGIN}<|" \
                            -e "/^[ ]*<right>/s|>[0-9]*<|>${OB_MARGIN}<|" \
                            -i "$OB_CONFIG"
              ;;
          esac
    ;;
    int*) sed -e '/^origin[ ]*/s|[^[ ]*]*$|bottom-center|' \
              -e '/^offset[ ]*/s|[^[ ]*]*$|0x60|' \
              -s -i "$DUNST_DIR"/*.'interactive.dunstrc'
          sed -e '/^[ ]*exts-window-height/s|:[ ]*.*;$|:               89.5%;|' \
              -e '/^[ ]*exts-window-location/s|:[ ]*.*;$|:             south east;|' \
              -e '/^[ ]*exts-window-x-offset/s|:[ ]*.*;$|:             0px;|' \
              -e '/^[ ]*exts-window-y-offset/s|:[ ]*.*;$|:             0px;|' \
              -e '/^[ ]*exts-window-border-radius/s|:[ ]*.*;$|:        60px 0px 0px 0px;|' \
              -e '/^[ ]*exts-message-border-radius/s|:[ ]*.*;$|:       45px 8px 8px 8px;|' \
              -i "$ROFI_SHARED_CONFIG"
          sed -e "/^[ ]*<top>/s|>[0-9]*<|>$((30+OB_MARGIN))<|" \
              -e "/^[ ]*<bottom>/s|>[0-9]*<|>${OB_MARGIN}<|" \
              -e "/^[ ]*<left>/s|>[0-9]*<|>${OB_MARGIN}<|" \
              -e "/^[ ]*<right>/s|>[0-9]*<|>${OB_MARGIN}<|" \
              -i "$OB_CONFIG"
    ;;
esac

exit ${?}
