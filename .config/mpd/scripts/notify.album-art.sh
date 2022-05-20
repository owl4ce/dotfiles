#!/usr/bin/env sh

# The MPD's track album-art notification-sender.
# https://github.com/owl4ce/dotfiles

# shellcheck disable=SC2166,SC2086

export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

[ -x "$(command -v mpd)" -a -x "$(command -v mpc)" -a -x "$(command -v magick)" ] || exit ${?}

{
    FILE="$(mpc -p ${CHK_MPD_PORT} -f '%file%' current)" ALBUM_DIR="${FILE%/*}"

    [ -n "$ALBUM_DIR" ] || exit ${?}

    ALBUM="$(mpc -p ${CHK_MPD_PORT} -f '%album%' current)"

    [ -n "${CHK_MPD_MUSIC_DIR%%~*}" ] || CHK_MPD_MUSIC_DIR="${HOME}/${CHK_MPD_MUSIC_DIR#*~/}"

    read -r ALBUM_COVER <<- EOF
		$(find "${CHK_MPD_MUSIC_DIR}/${ALBUM_DIR}"  -type d \
													-exec find "{}" -maxdepth 1 \
																	-type f \
																	-iregex \
		".*/.*\(${ALBUM}\|cover\|folder\|artwork\|front\).*[.]\(jpe?g\|png\|gif\|bmp\)" \;)
	EOF

    if [ -f "$ALBUM_COVER" ]; then

        magick "$ALBUM_COVER" \
               -strip \
               -interlace Plane \
               -sampling-factor 4:2:0 \
               -define jpeg:dct-method=float \
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
               -quality 85% \
        "$MPD_NOTIFY_AA_IMG"

    elif [ -f "$MPD_NOTIFY_AA_IMG" ]; then
        rm -f "$MPD_NOTIFY_AA_IMG"
    fi

    [ -f "$MPD_NOTIFY_AA_IMG" ] || MPD_NOTIFY_AA_IMG=

    INFO="$(mpc -p ${CHK_MPD_PORT} -f '%artist% /S/ [%title%|%file%]' current)"

    exec dunstify '' "<span size='small'>${INFO%%\ /S/\ *}</span>\n${INFO##*\ /S/\ }" \
                  -h string:synchronous:ncmpcpp-album-art \
                  -I "${MPD_NOTIFY_AA_IMG:-${MUSIC_ICON}}"
} &

exit ${?}
