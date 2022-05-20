#!/usr/bin/env sh

# Setup Openbox window-buttons or toggle decoration.
# https://github.com/owl4ce/dotfiles

# SPDX-License-Identifier: ISC

# shellcheck disable=SC3044

export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

# Single-execution options.
case "${1}" in
    '') # Rofi interface of Openbox button selector.
        BUTTON="$(for LS in "$OB_BUTTON_STYLE_DIR"/*; do
                      [ ! -d "$LS" ] || echo "${LS##*/}"
                  done \
                  | rofi -theme-str '@import "action.rasi"' \
                         -no-show-icons \
                         -no-lazy-grab \
                         -no-plugins \
                         -dmenu \
                         -mesg 'Select Window Button-Style')"

        # Ensure the user has selected the Openbox button.
        [ -n "$BUTTON" ] || exit ${?}

        # https://gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html#:~:text=expand_aliases
        [ -z "$BASH" ] || shopt -s expand_aliases

        # Get the variables. No further explanation :P
        joyd_cross_variables

        # Synchronize Openbox button files.
        ln -fnrs "${OB_BUTTON_STYLE_DIR}/${BUTTON}"/*.'xbm' "${OBT_D}/"

        # Write configuration.
        sed -e "/^ob_button_style.${CHK_THEME}.${CHK_MODE}[ ]*/s|\".*\"$|\"${BUTTON}\"|" -i "$THEME_FILE"
    ;;
    s*) # Conditionally synchronize Openbox button configuration.
        if [ "$CHK_OB_BUTTON_LOC" != 'left' ]; then
            # Synchronize Openbox button configuration.
            sed -e '/^[ ]*<titleLayout>/s|>[A-Z]*<|>CIML<|' -i "$OB_CONFIG"
            # Write configuration.
            sed -e "/^ob_button_location.${CHK_THEME}.${CHK_MODE}[ ]*/s|\"[a-z]*\"$|\"left\"|" -i "$THEME_FILE"
        elif [ "$CHK_OB_BUTTON_LOC" != 'right' ]; then
            # Synchronize Openbox button configuration.
            sed -e '/^[ ]*<titleLayout>/s|>[A-Z]*<|>LIMC<|' -i "$OB_CONFIG"
            # Write configuration.
            sed -e "/^ob_button_location.${CHK_THEME}.${CHK_MODE}[ ]*/s|\"[a-z]*\"$|\"right\"|" -i "$THEME_FILE"
        fi
    ;;
    d*) # Get the exact line of application class in the Openbox configuration.
        CHK_OB_DECOR_LINE="$(grep -m1 -Fno '<application class="*" type="normal">' "$OB_CONFIG")" \
        CHK_OB_DECOR_LINE="$((${CHK_OB_DECOR_LINE%%:*}+1))"

        # Get the current status of Openbox decoration.
        CHK_OB_DECOR_STAT="$(sed -e "${CHK_OB_DECOR_LINE}s|^[ ]*<decor>\(.*\)</decor>$|\1|p" -n "$OB_CONFIG")"

        # Synchronize Openbox decoration configuration.
        if [ "$CHK_OB_DECOR_STAT" != 'yes' ]; then
            sed -e "${CHK_OB_DECOR_LINE}s|<decor>[a-z]*</decor>$|<decor>yes</decor>|" -i "$OB_CONFIG"
        elif [ "$CHK_OB_DECOR_STAT" != 'no' ]; then
            sed -e "${CHK_OB_DECOR_LINE}s|<decor>[a-z]*</decor>$|<decor>no</decor>|" -i "$OB_CONFIG"
        fi

        # Arguments that passes `openbox` command.
        ARGS='--restart'
    ;;
esac

# Reconfigure Openbox in the background, so it's parallelized (for performance reasons).
openbox --reconfigure ${ARGS} &

exit ${?}
