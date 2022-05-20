#!/usr/bin/env sh

# The ncmpcpp album-art executor.
# https://github.com/owl4ce/dotfiles

export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

[ -x "$(command -v mpd)" -a -x "$(command -v mpc)" -a -x "$(command -v magick)" ] || exit ${?}

[ -z "$NCMPCPP_AA_NICENESS" ] || renice -n "$NCMPCPP_AA_NICENESS" "${$}" >&2

w3m()
{
    [ -x "$(command -v xdotool)" ] || exec printf '\033c%s' 'error: xdotool is not installed!'

    TERMINAL_WINDOW="${WINDOWID:-$(xdotool getactivewindow)}"

    echo "${$}" >"$NCMPCPP_AA_PID"

    read -r W3M_IMG_DISPLAY <<- EOF
		$(find ${LIBS_PATH} -type f -path '*/w3m/*' -iname 'w3mim*')
	EOF

    while IFS= read -r P <"$NCMPCPP_AA_PID" && [ "${P:-0}" -eq "${$}" ]; do

        eval $(xdotool getwindowgeometry --shell "$TERMINAL_WINDOW")

        if [ -n "$WIDTH" ]; then

            WIDTH="$(printf '%.f\n' "$((${WIDTH}000000/EFLOAT))e-3")"

            ${W3M_IMG_DISPLAY:-break} >&2 <<- EOF
				0;1;0;0;${WIDTH};${WIDTH};;;;;${NCMPCPP_AA_IMG}
				3;
				4
			EOF

            WIDTH=

        else
            sleep .022s
            printf '\033c%s' 'error: invalid window geometry. Relaunch!'
        fi

    done
}

pixbuf()
{
    printf '\033]20;%b;%b:op=keep-aspect\007' "$NCMPCPP_AA_IMG" "${GPX}x${GPX}+${OFF}+${OFF}"
}

{
    case "${1}" in
        '') exit ${?}
        ;;
        a*) EFLOAT='3521' GPX='67' OFF='00'
        ;;
        s*) EFLOAT='1166' GPX='86' OFF='04'
        ;;
    esac

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
               -quality 85% \
        "$NCMPCPP_AA_IMG"

    else
        magick -depth 8 canvas:transparent "PNG8:${NCMPCPP_AA_IMG}"
    fi

    [ ! -f "$NCMPCPP_AA_IMG" ] || "$NCMPCPP_AA_BACKEND"
} &

exit ${?}
