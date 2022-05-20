#!/usr/bin/env sh

# The ncmpcpp album-art executor.
# https://github.com/owl4ce/dotfiles

# SPDX-License-Identifier: ISC

# shellcheck disable=SC2166,SC2086

export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

# Ensure `mpd`, `mpc`, and `magick` already installed for safety and performance reasons.
[ -x "$(command -v mpd)" -a -x "$(command -v mpc)" -a -x "$(command -v magick)" ] || exit ${?}

# Alter current process priority if $NCMPCPP_AA_NICENESS is set.
[ -z "$NCMPCPP_AA_NICENESS" ] || renice -n "$NCMPCPP_AA_NICENESS" "${$}" >&2

# w3mimgdisplay image backend.
w3m()
{
    # Ensure `xdotool` already installed for safety and performance reasons.
    [ -x "$(command -v xdotool)" ] || exec printf '\033c%s' 'error: xdotool is not installed!'

    # Use the built-in $WINDOWID provided by the terminal emulator, fallback to `xdotool`.
    WINDOWID="${WINDOWID:-$(xdotool getactivewindow)}"

    # Save the current PID, used for the later loop condition of album-art image viewer.
    echo "${$}" >"$NCMPCPP_AA_PID"

    # Get `w3mimgdisplay` single-executable path.
    read -r W3M_IMG_DISPLAY <<- EOF
		$(find ${LIBS_PATH} -type f -path '*/w3m/*' -name 'w3mimg*')
	EOF

    # Loop condition of album-art image viewer, match current and saved PID.
    while IFS= read -r P <"$NCMPCPP_AA_PID" && [ "${P:-0}" -eq "${$}" ]; do

        # Get terminal emulator window geometry with `xdotool`, width and/or height.
        eval "$(xdotool getwindowgeometry --shell "$WINDOWID")"

        # Ensure $WIDTH isn't empty.
        if [ -n "$WIDTH" ]; then

            # Calculate width in pixels with complicated float algorithm.
            WIDTH="$(printf '%.f\n' "$((${WIDTH}000000/EFLOAT))e-3")"

            # Display album-art image to output if executable is found.
            "${W3M_IMG_DISPLAY:-break}" >&2 <<- IMG
				0;1;0;0;${WIDTH};${WIDTH};;;;;${NCMPCPP_AA_IMG}
				3;
			IMG

            # Clear $WIDTH.
            WIDTH=

        else
            sleep .022s
            printf '\033c%s' 'error: invalid window geometry. Relaunch!'
        fi

    done
}

# pixbuf image backend.
pixbuf()
{
    printf '\033]20;%s;%s:op=keep-aspect\007' "$NCMPCPP_AA_IMG" "${GPX}x${GPX}+${OFF}+${OFF}"
}

# Process as a background task.
{
    # Single-execution options.
    case "${1}" in
        '') exit ${?}
        ;;
        a*) EFLOAT='3521' GPX='67' OFF='00'
        ;;
        s*) EFLOAT='1166' GPX='86' OFF='04'
        ;;
    esac

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

    # Rescale and convert album-art image into rounded corners, fallback to blank image.
    if [ -f "$ALBUM_COVER" ]; then

        magick "$ALBUM_COVER" \
               -strip \
               -interlace Plane \
               -scale 500x500\! \
               -depth 8 \
           '(' -clone 0 \
               -alpha extract \
               -draw 'fill black polygon 0,0 0,6 6,0 fill white circle 6,6 6,0' \
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
        "$NCMPCPP_AA_IMG" \
        || magick -depth 8 canvas:transparent "PNG8:${NCMPCPP_AA_IMG}"

    else
        magick -depth 8 canvas:transparent "PNG8:${NCMPCPP_AA_IMG}"
    fi

    # Execute supported album-art image viewer.
    [ ! -f "$NCMPCPP_AA_IMG" ] || "$NCMPCPP_AA_BACKEND"
} &

exit ${?}
