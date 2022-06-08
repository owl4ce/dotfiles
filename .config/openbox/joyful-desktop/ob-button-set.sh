#!/usr/bin/env sh

# Desc:   Set-up Openbox button or toggle decoration.
# Author: Harry Kurn <alternate-se7en@pm.me>
# URL:    https://github.com/owl4ce/dotfiles/tree/ng/.config/openbox/joyful-desktop/ob-button-set.sh

# SPDX-License-Identifier: ISC

# shellcheck disable=SC3044

export LANG='POSIX'
exec >/dev/null 2>&1
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

        # https://gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html#:~:text=expand_aliases
        [ -z "$BASH" ] || shopt -s expand_aliases

        joyd_cross_variables

        ln -fnrs "${OB_BUTTON_STYLE_DIR}/${BUTTON}"/*.'xbm' "${OBT_D}/"

        sed -e "/^ob_button_style.${CHK_THEME}.${CHK_MODE}[ ]*/s|\".*\"$|\"${BUTTON}\"|" -i "$THEME_FILE"
    ;;
    s*) if [ "$CHK_OB_BUTTON_LOC" != 'left' ]; then
            sed -e '/^[ ]*<titleLayout>/s|>[A-Z]*<|>CIML<|' -i "$OB_CONFIG"
            sed -e "/^ob_button_location.${CHK_THEME}.${CHK_MODE}[ ]*/s|\"[a-z]*\"$|\"left\"|" -i "$THEME_FILE"
        elif [ "$CHK_OB_BUTTON_LOC" != 'right' ]; then
            sed -e '/^[ ]*<titleLayout>/s|>[A-Z]*<|>LIMC<|' -i "$OB_CONFIG"
            sed -e "/^ob_button_location.${CHK_THEME}.${CHK_MODE}[ ]*/s|\"[a-z]*\"$|\"right\"|" -i "$THEME_FILE"
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
