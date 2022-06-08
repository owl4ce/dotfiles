#!/usr/bin/env sh

# Desc:   Take screenshot by select the visible window or draw.
# Author: Harry Kurn <alternate-se7en@pm.me>
# URL:    https://github.com/owl4ce/dotfiles/tree/ng/.scripts/screenshot-selection.sh

# SPDX-License-Identifier: ISC

# shellcheck disable=SC2016,SC2166

export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

[ -x "$(command -v scrot)" ] || exec dunstify 'Install `scrot`!' -h string:synchronous:install-deps \
                                                                 -a joyful_desktop \
                                                                 -u low

{
    rm -f "$TMP_DIR"/*_scrot*.* &

    # Add 210ms delay to trick compositor fade animation.
    sleep .21s

    [ "$SS_POINTER" != 'yes' ] || ARGS='-p'

    scrot ${ARGS} -b \
                  -e "mv -f \$f \"${TMP_DIR}/\"" \
                  -f \
                  -i \
                  -l style=dash,width=3,color=#2be491 \
                  -s \
                  -z \
    || exec dunstify '' 'Screenshot canceled!' -h string:synchronous:screenshot-selection \
                                                -a joyful_desktop \
                                                -i "$SCREENSHOT_ICON" \
                                                -u low

    wait

    for CURRENT in "$TMP_DIR"/*_scrot*.*; do
        CURRENT="${CURRENT##*/}"
        break
    done

    if [ "$SS_USE_FRAME" = 'yes' ]; then

        # Use `imagemagick` to determine the dominant color of the captured image, and
        # ensure all hexadecimal colors are valid through Extended Regular Expression.
        if [ "$SS_FRAME_COLOR" = 'auto' ]; then

            SS_FRAME_COLOR="$(magick "${TMP_DIR}/${CURRENT}" \
                                     -strip \
                                     -scale 50x50\! \
                                     -depth 8 \
                                     +dither \
                                     -colors 8 \
                                     -format %c \
                              histogram:info: \
                              | sort -nr | grep -m1 -Eo '[#][0-9a-fA-F]{1,}')"

        elif

            grep -m1 -Eoq '^[#][0-9a-fA-F]{1,}$' <<- HEX
				${SS_FRAME_COLOR}
			HEX

        then
            :
        else
            PRESERVED_SFC="$SS_FRAME_COLOR"
            SS_FRAME_COLOR=
        fi

        if [ -n "$SS_FRAME_COLOR" ]; then
            dunstify '' "Processing captured picture ..\n<span size='small'>Magick ${SS_FRAME_COLOR} ..</span>" \
                     -h string:synchronous:screenshot-selection \
                     -a joyful_desktop \
                     -i "$SCREENSHOT_ICON" \
                     -t 1000
        elif [ -n "$PRESERVED_SFC" ]; then
            exec dunstify '' "Screenshot failed!\n<span size='small'><u>${PRESERVED_SFC}</u> isn't hex!</span>" \
                          -h string:synchronous:screenshot-selection \
                          -a joyful_desktop \
                          -i "$SCREENSHOT_ICON" \
                          -u low
        fi

        magick "ephemeral:${TMP_DIR}/${CURRENT}" \
           '(' -clone 0 \
               -alpha extract \
               -draw 'fill black polygon 0,0 0,8 8,0 fill white circle 8,8 8,0' \
           '(' -clone 0 \
               -flip \
           ')' -compose Multiply \
               -composite \
           '(' -clone 0 \
               -flop \
           ')' -compose Multiply \
               -composite \
           ')' -alpha off \
               -compose CopyOpacity \
               -composite \
               -quality 100 \
        miff:- \
        | magick - \
           '(' -clone 0 \
               -background black \
               -shadow "${SS_FRAME_S_OPACITY:-25}x${SS_FRAME_PADDING:-15}+0+$((${SS_FRAME_PADDING:-15}/2))" \
           ')' +swap \
               -background none \
               -layers merge \
               +repage \
               -quality 100 \
        miff:- \
        | magick - \
               -bordercolor "$SS_FRAME_COLOR" \
               -border 5 \
               -quality "${SS_QUALITY:-75}" \
        "${TMP_DIR}/${CURRENT}" \
        || exec dunstify '' "Screenshot failed!\n<span size='small'>Error occurred in ImageMagick!</span>" \
                         -h string:synchronous:screenshot-selection \
                         -a joyful_desktop \
                         -i "$SCREENSHOT_ICON" \
                         -u low

    fi

    while :; do
        if [ "$SS_CP2CLP" = 'yes' -a -x "$(command -v xclip)" ]; then
            xclip -selection clipboard -target image/png -i "${TMP_DIR}/${CURRENT}"
            STS2='\nCLIPBOARD'
            break
        elif [ "$SS_SAVE" != 'yes' ]; then
            SS_CP2CLP='yes'
        else
            break
        fi
    done

    if [ "$SS_SAVE" = 'yes' ]; then
        [ -d "${SS_SVDIR}/Screenshots" ] || mkdir -p "${SS_SVDIR}/Screenshots"
        mv -f "${TMP_DIR}/${CURRENT}" "${SS_SVDIR}/Screenshots/"
        STS1="${SS_SVDIR##*/}/Screenshots"
    else
        rm -f "${TMP_DIR}/${CURRENT}"
        STS2='CLIPBOARD'
    fi

    exec dunstify '' "<span size='small'><u>${STS1}</u><i>${STS2}</i></span>\nPicture obtained!" \
                  -h string:synchronous:screenshot-selection \
                  -a joyful_desktop \
                  -i "$SCREENSHOT_ICON" \
                  -u low
} &

exit ${?}
