#!/usr/bin/env sh

# Setup Openbox window-buttons or toggle decoration.
# https://github.com/owl4ce/dotfiles

export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

case "${1}" in
    '') BUTTON="$(for LS in "$OB_BUTTON_STYLE_DIR"/*; do
                      [ ! -d "$LS" ] || echo "${LS##*/}"
                  done \
                  | rofi -theme-str '@import "action.rasi"' \
                         -no-show-icons \
                         -no-lazy-grab \
                         -no-plugins \
                         -dmenu \
                         -mesg 'Select Window Button-Style')"

        [ -n "$BUTTON" ] || exit ${?}

        joyd_cross_variables

        install -m644 -t "${OBT_D}/" "${OB_BUTTON_STYLE_DIR}/${BUTTON}"/*.'xbm'

        sed -e "/^ob_button_style.${CHK_THEME}.${CHK_MODE}[ ]*/s|\".*\"$|\"${BUTTON}\"|" -i "$THEME_FILE"
    ;;
    s*) if [ "$CHK_OB_BUTTON_LOC" != 'left' ]; then
            sed -e '/^[ ]*<titleLayout>/s|>[A-Z]*<|>CIML<|' -i "$OB_CONFIG"
            sed -e "/^ob_button_location.${CHK_THEME}.${CHK_MODE}[ ]*/s|\".*\"$|\"left\"|" -i "$THEME_FILE"
        elif [ "$CHK_OB_BUTTON_LOC" != 'right' ]; then
            sed -e '/^[ ]*<titleLayout>/s|>[A-Z]*<|>LIMC<|' -i "$OB_CONFIG"
            sed -e "/^ob_button_location.${CHK_THEME}.${CHK_MODE}[ ]*/s|\".*\"$|\"right\"|" -i "$THEME_FILE"
        fi
    ;;
    d*) CHK_OB_DECOR_LINE="$(grep -m1 -Fno '<application class="*" type="normal">' "$OB_CONFIG")" \
        CHK_OB_DECOR_LINE="$((${CHK_OB_DECOR_LINE%%:*}+1))"

        CHK_OB_DECOR_STAT="$(sed -e "${CHK_OB_DECOR_LINE}s|^[ ]*<decor>\(.*\)</decor>$|\1|p" -n "$OB_CONFIG")"

        if [ "$CHK_OB_DECOR_STAT" != 'yes' ]; then
            sed -e "${CHK_OB_DECOR_LINE}s|<decor>[a-z]*</decor>$|<decor>yes</decor>|" -i "$OB_CONFIG"
        elif [ "$CHK_OB_DECOR_STAT" != 'no' ]; then
            sed -e "${CHK_OB_DECOR_LINE}s|<decor>[a-z]*</decor>$|<decor>no</decor>|" -i "$OB_CONFIG"
        fi

        ARGS='--restart'
    ;;
esac

openbox --reconfigure ${ARGS} &

exit ${?}
