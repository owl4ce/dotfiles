#!/usr/bin/env sh

# Desc:   Set-up X.Org wallpaper.
# Author: Harry Kurn <alternate-se7en@pm.me>
# URL:    https://github.com/owl4ce/dotfiles/tree/ng/.config/openbox/joyful-desktop/wallpaper-set.sh

# SPDX-License-Identifier: ISC

# shellcheck disable=SC2016

export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

case "${1}" in
    '') WALLPAPER="$(for LS in "$CHK_WALLPAPER_DIR"/*.*; do
                         [ ! -f "$LS" ] || echo "${LS##*/}"
                     done \
                     | rofi -theme-str '@import "action.rasi"' \
                            -no-show-icons \
                            -no-lazy-grab \
                            -no-plugins \
                            -dmenu \
                            -mesg 'Select X Wallpaper')"

        [ -n "$WALLPAPER" ] || exit ${?}

        nitrogen --force-setter=xwindows --set-zoom-fill --save "${CHK_WALLPAPER_DIR}/${WALLPAPER}"

        sed -e "/^wallpaper.${CHK_THEME}.${CHK_MODE}[ ]*/s|\".*\"$|\"${WALLPAPER}\"|" -i "$THEME_FILE"

        dunstify '' "<span size='small'><u>${WALLPAPER}</u></span>\nSuccessfully applied!" \
                 -h string:synchronous:wallpaper-set \
                 -a joyful_desktop \
                 -i "$WALLPAPER_ICON" \
                 -u low
    ;;
    g*) [ -x "$(command -v magick)" ] || exec dunstify 'Install `imagemagick`!' -h string:synchronous:install-deps \
                                                                                -a joyful_desktop \
                                                                                -u low

        cd -- "$WALLPAPERS_DIR" || exit ${?}

        for RAW in *.*; do

            if [ -f "$RAW" ] && GET_WP_SIZE="$(identify -format %w "$RAW")" && [ -n "$GET_WP_SIZE" ]; then

                dunstify '' "Generating X wallpaper ..\n<span size='small'><u>${RAW}</u></span>" \
                         -h string:synchronous:wallpaper-set \
                         -a joyful_desktop \
                         -i "$WALLPAPER_ICON" \
                         -t 1000

                if [ "$GET_WP_SIZE" -lt 1920 ]; then
                    RES='_HD'
                elif [ "$GET_WP_SIZE" -lt 2048 ]; then
                    RES='_FHD'
                elif [ "$GET_WP_SIZE" -lt 2880 ]; then
                    RES='_2K'
                elif [ "$GET_WP_SIZE" -lt 3840 ]; then
                    RES='_3K'
                elif [ "$GET_WP_SIZE" -lt 5120 ]; then
                    RES='_4K'
                elif [ "$GET_WP_SIZE" -lt 6144 ]; then
                    RES='_5K'
                elif [ "$GET_WP_SIZE" -lt 7168 ]; then
                    RES='_6K'
                elif [ "$GET_WP_SIZE" -lt 7680 ]; then
                    RES='_7K'
                elif [ "$GET_WP_SIZE" -eq 7680 ]; then
                    RES='_8K'
                else
                    RES='_ULTRA'
                fi

                case "$CHK_THEME" in
                    mech*) magick "$RAW" \
                                  -gravity center \
                                  -crop 16:9 \
                              '(' -clone 0 \
                                  -fill '#4c566a' \
                                  -colorize 50% \
                              ')' -gravity center \
                                  -compose lighten \
                                  -composite \
                              '(' -clone 0 \
                                  -fill '#4c566a' \
                                  -colorize 20% \
                              ')' -gravity center \
                                  -compose darken \
                                  -composite \
                                  -quality 100 \
                           "${CHK_WALLPAPER_DIR}/${RAW%.*}${RES}.jpg" \
                           || continue
                    ;;
                    eyec*) magick "$RAW" \
                                  -gravity center \
                                  -crop 16:9 \
                              '(' -clone 0 \
                                  -fill white \
                                  -colorize 20% \
                                  -modulate 100,127,97 \
                              ')' -fill black \
                                  -colorize 2.2% \
                                  -gravity center \
                                  -compose lighten \
                                  -composite \
                                  -quality 100 \
                           "${CHK_WALLPAPER_DIR}/${RAW%.*}${RES}.jpg" \
                           || continue
                    ;;
                esac

                dunstify '' "Successfully generated!\n<span size='small'>Now it's time to change X wallpaper</span>" \
                         -h string:synchronous:wallpaper-set \
                         -a joyful_desktop \
                         -i "$WALLPAPER_ICON" \
                         -u low

            elif [ -d "$RAW" ]; then

                continue

            else

                dunstify '' "Nothing to generate!\n<span size='small'>Puts in <u>~/${WALLPAPERS_DIR##*/}</u></span>" \
                         -h string:synchronous:wallpaper-set \
                         -a joyful_desktop \
                         -i "$WALLPAPER_ICON" \
                         -u low

            fi

        done
    ;;
esac

exit ${?}
