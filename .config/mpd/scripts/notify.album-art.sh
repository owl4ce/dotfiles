#!/usr/bin/env sh

# Desc:   MPD track notification-sender.
# Author: Harry Kurn <alternate-se7en@pm.me>
# URL:    https://github.com/owl4ce/dotfiles/tree/ng/.config/mpd/scripts/notify.album-art.sh

# SPDX-License-Identifier: ISC

# shellcheck disable=SC2166

export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

[ -x "$(command -v mpd)" -a -x "$(command -v mpc)" -a -x "$(command -v magick)" ] || exit ${?}

{
    FILE="$(mpc -p "$CHK_MPD_PORT" -f '%file% ########## %album%' current)"

    [ -n "${FILE%/*\ #####\ *}" ] || exit ${?}

    [ -n "${CHK_MPD_MUSIC_DIR%%~*}" ] || CHK_MPD_MUSIC_DIR="${HOME}/${CHK_MPD_MUSIC_DIR#~*/}"

    read -r ALBUM_COVER <<- EOF
		$(find "${CHK_MPD_MUSIC_DIR}/${FILE%/*\ #####\ *}/" -maxdepth 1 \
															-type f \
															-iregex \
		".*/.*\(${FILE##*\ #####\ }\|cover\|folder\|artwork\|front\).*[.]\(jpe?g\|png\|gif\|bmp\)")
	EOF

    if [ -f "$ALBUM_COVER" ]; then

        magick "$ALBUM_COVER" \
               -strip \
               -interlace Plane \
               -scale 120x120\! \
               -depth 8 \
           '(' -clone 0 \
               -alpha extract \
               -draw 'fill black polygon 0,0 0,9 9,0 fill white circle 9,9 9,0' \
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
               -quality 9 \
        "$MPD_NOTIFY_AA_IMG" \
        || MPD_NOTIFY_AA_IMG=

    else
        MPD_NOTIFY_AA_IMG=
    fi

    INFO="$(mpc -p "$CHK_MPD_PORT" -f '%artist% ########## [%title%|%file%]' current)"

    exec dunstify '' "<span size='small'>${INFO%%\ #####\ *}</span>\n${INFO##*\ #####\ }" \
                  -h string:synchronous:ncmpcpp-album-art \
                  -I "${MPD_NOTIFY_AA_IMG:-${MUSIC_ICON}}" \
                  -r 1061 # https://github.com/dunst-project/dunst/issues/1061
} &

exit ${?}
