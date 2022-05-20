#!/usr/bin/env sh

# The MPD's track album-art notification-sender.
# https://github.com/owl4ce/dotfiles

# SPDX-License-Identifier: ISC

# shellcheck disable=SC2166

export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

# Ensure `mpd`, `mpc`, and `magick` already installed for safety and performance reasons.
[ -x "$(command -v mpd)" -a -x "$(command -v mpc)" -a -x "$(command -v magick)" ] || exit ${?}

# Process as a background task.
{
    # Get file path, merge with album-name of current track.
    FILE="$(mpc -p "$CHK_MPD_PORT" -f '%file% ########## %album%' current)"

    # Ensure the file path is valid.
    [ -n "${FILE%/*\ #####\ *}" ] || exit ${?}

    # Update $CHK_MPD_MUSIC_DIR if in the mpd configuration contains tilde. This is bug fix.
    [ -n "${CHK_MPD_MUSIC_DIR%%~*}" ] || CHK_MPD_MUSIC_DIR="${HOME}/${CHK_MPD_MUSIC_DIR#~*/}"

    # Get single album-art image.
    read -r ALBUM_COVER <<- EOF
		$(find "${CHK_MPD_MUSIC_DIR}/${FILE%/*\ #####\ *}/" -maxdepth 1 \
															-type f \
															-iregex \
		".*/.*\(${FILE##*\ #####\ }\|cover\|folder\|artwork\|front\).*[.]\(jpe?g\|png\|gif\|bmp\)")
	EOF

    # Rescale and convert album-art image into rounded corners.
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

    # Get current track artist, merge with title, fallback to file path.
    INFO="$(mpc -p "$CHK_MPD_PORT" -f '%artist% ########## [%title%|%file%]' current)"

    # Send notification with album-art image as raw icon.
    exec dunstify '' "<span size='small'>${INFO%%\ #####\ *}</span>\n${INFO##*\ #####\ }" \
                  -h string:synchronous:ncmpcpp-album-art \
                  -I "${MPD_NOTIFY_AA_IMG:-${MUSIC_ICON}}"
} &

exit ${?}
