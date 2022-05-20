#!/usr/bin/env sh

# Setup themes for each modes.
# https://github.com/owl4ce/dotfiles

# SPDX-License-Identifier: ISC

# shellcheck disable=SC3044

export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

# Synchronize rofi configuration to current theme.
sed -e "/^@import[ ]*/s|schemes/[a-z]*.rasi|schemes/${CHK_THEME}.rasi|" -i "$ROFI_CONFIG"

# https://gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html#:~:text=expand_aliases
[ -z "$BASH" ] || shopt -s expand_aliases

# Execute Openbox margins, dunst, and rofi setup shell-script conditionally.
case "$CHK_PANEL_ORT" in
    vert*) joyd_layout_set "vertical_${CHK_PANEL_ORT_V}"
    ;;
    hori*) joyd_layout_set "horizontal_${CHK_PANEL_ORT_H}"
    ;;
esac

# Get the variables. No further explanation :P
joyd_cross_variables

# Synchronize Openbox button files.
ln -fnrs "${OB_BUTTON_STYLE_DIR}/${CHK_OB_BUTTON_STYLE}"/*.'xbm' "${OBT_D}/"

# Conditionally synchronize Openbox button configuration.
case "$CHK_OB_BUTTON_LOC" in
    l*) sed -e '/^[ ]*<titleLayout>/s|>[A-Z]*<|>CIML<|' -i "$OB_CONFIG"
    ;;
    r*) sed -e '/^[ ]*<titleLayout>/s|>[A-Z]*<|>LIMC<|' -i "$OB_CONFIG"
    ;;
esac

# Get the exact line of Openbox theme in the Openbox configuration.
CHK_OB_THEME_LINE="$(grep -m1 -Fno '<theme>' "$OB_CONFIG")" \
CHK_OB_THEME_LINE="$((${CHK_OB_THEME_LINE%%:*}+1))"

# Synchronize Openbox theme configuration.
sed -e "${CHK_OB_THEME_LINE}s|<name>.*</name>$|<name>${GTK_T}</name>|" -i "$OB_CONFIG"

# Synchronize GTK-2 configuration to current theme and icon.
sed -e "/^gtk-icon-theme-name/s|\".*\"$|\"${ICON_T}\"|" \
    -e "/^gtk-theme-name/s|\".*\"$|\"${GTK_T}\"|" \
    -i "$GTK2_CONFIG"

# Synchronize GTK-3 configuration to current theme and icon.
sed -e "/^gtk-icon-theme-name/s|=.*$|=${ICON_T}|" \
    -e "/^gtk-theme-name/s|=.*$|=${GTK_T}|" \
    -i "$GTK3_CONFIG"

# Live reload GTK engine.
joyd_gtk_live_reload "$GTK_T" "$ICON_T"

exit ${?}
