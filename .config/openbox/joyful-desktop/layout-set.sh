#!/usr/bin/env sh

# Setup Openbox margins, dunst, and rofi (not implemented yet).
# https://github.com/owl4ce/dotfiles

export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

case "$CHK_MODE" in
    art*) case "${1}" in
              vert*_l*) sed -e '/^origin[ ]*/s|[^[ ]*]*$|top-right|' \
                            -e '/^offset[ ]*/s|[^[ ]*]*$|25x50|' \
                            -s -i "$DUNST_DIR"/*.'artistic.dunstrc'

                        sed -e "/^[ ]*<top>/s|>[0-9]*<|>${OB_MARGIN}<|" \
                            -e "/^[ ]*<bottom>/s|>[0-9]*<|>${OB_MARGIN}<|" \
                            -e "/^[ ]*<left>/s|>[0-9]*<|>$((45+OB_MARGIN))<|" \
                            -e "/^[ ]*<right>/s|>[0-9]*<|>${OB_MARGIN}<|" \
                            -i "$OB_CONFIG"
              ;;
              vert*_r*) sed -e '/^origin[ ]*/s|[^[ ]*]*$|top-left|' \
                            -e '/^offset[ ]*/s|[^[ ]*]*$|25x50|' \
                            -s -i "$DUNST_DIR"/*.'artistic.dunstrc'

                        sed -e "/^[ ]*<top>/s|>[0-9]*<|>${OB_MARGIN}<|" \
                            -e "/^[ ]*<bottom>/s|>[0-9]*<|>${OB_MARGIN}<|" \
                            -e "/^[ ]*<left>/s|>[0-9]*<|>${OB_MARGIN}<|" \
                            -e "/^[ ]*<right>/s|>[0-9]*<|>$((45+OB_MARGIN))<|" \
                            -i "$OB_CONFIG"
              ;;
              hori*_t*) sed -e '/^origin[ ]*/s|[^[ ]*]*$|bottom-right|' \
                            -e '/^offset[ ]*/s|[^[ ]*]*$|25x25|' \
                            -s -i "$DUNST_DIR"/*.'artistic.dunstrc'

                        sed -e "/^[ ]*<top>/s|>[0-9]*<|>$((45+OB_MARGIN))<|" \
                            -e "/^[ ]*<bottom>/s|>[0-9]*<|>${OB_MARGIN}<|" \
                            -e "/^[ ]*<left>/s|>[0-9]*<|>${OB_MARGIN}<|" \
                            -e "/^[ ]*<right>/s|>[0-9]*<|>${OB_MARGIN}<|" \
                            -i "$OB_CONFIG"
              ;;
              hori*_b*) sed -e '/^origin[ ]*/s|[^[ ]*]*$|top-right|' \
                            -e '/^offset[ ]*/s|[^[ ]*]*$|25x50|' \
                            -s -i "$DUNST_DIR"/*.'artistic.dunstrc'

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

          sed -e "/^[ ]*<top>/s|>[0-9]*<|>$((30+OB_MARGIN))<|" \
              -e "/^[ ]*<bottom>/s|>[0-9]*<|>${OB_MARGIN}<|" \
              -e "/^[ ]*<left>/s|>[0-9]*<|>${OB_MARGIN}<|" \
              -e "/^[ ]*<right>/s|>[0-9]*<|>${OB_MARGIN}<|" \
              -i "$OB_CONFIG"
    ;;
esac

exit ${?}
