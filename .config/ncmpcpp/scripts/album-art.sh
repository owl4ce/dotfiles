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
    if [ -x "$(command -v xprop)" -a -x "$(command -v xwininfo)" ]; then

        echo "${$}" >"$NCMPCPP_AA_PID"

        WIN_ID="$(xprop -root _NET_ACTIVE_WINDOW)" WIN_ID="${WIN_ID##*\ #}"

        W3M_IMG_DISPLAY="$(find ${LIBS_PATH} -type f -path '*/w3m/*' -iname 'w3mimgd*' | sed 1q)"

        while IFS= read -r PID <"$NCMPCPP_AA_PID" && [ "${$}" -eq "${PID:-0}" ]; do

            WIN_WIDTH="$(xwininfo -id "$WIN_ID" | sed -n -e 's|^[ ]*Width:[ ]*\([0-9]*\)$|\1|p')"

            if [ -n "$WIN_WIDTH" ]; then

                WIDTH="$(printf '%.f\n' "$((${WIN_WIDTH}000000/${F_W}))e-3")"

                ${W3M_IMG_DISPLAY:-break} >&2 <<- EOF
					0;1;0;0;${WIDTH};${WIDTH};;;;;${NCMPCPP_AA_IMG}
					3;
					4
				EOF

            else
                sleep .25s
                printf '\033c%s' 'error: invalid window width and/or height. Please relaunch!'
            fi

        done

    else
        sleep .25s
        printf '\033c%s' 'error: `xorg-xprop` and/or `xorg-xwininfo` are not installed!'
    fi
}

pixbuf() { printf "\033]20;${NCMPCPP_AA_IMG};${PX_G}x${PX_G}+${PX_O}+${PX_O}:op=keep-aspect\a"; }

{
    case "${1}" in
        '') exit ${?}
        ;;
        a*) F_W='3521' PX_G='67' PX_O='00'
        ;;
        s*) F_W='1166' PX_G='86' PX_O='04'
        ;;
    esac

    FILE="$(mpc -p ${CHK_MPD_PORT} -f '%file%' current)" ALBUM_DIR="${FILE%/*}"

    [ -n "$ALBUM_DIR" ] || exit ${?}

    ALBUM="$(mpc -p ${CHK_MPD_PORT} -f '%album%' current)"

    [ -n "${CHK_MPD_MUSIC_DIR%%~*}" ] || CHK_MPD_MUSIC_DIR="${HOME}/${CHK_MPD_MUSIC_DIR#*~/}"

    ALBUM_COVER="$(find "${CHK_MPD_MUSIC_DIR}/${ALBUM_DIR}" -type d \
                                                            -exec find "{}" -maxdepth 1 \
                                                                            -type f \
                                                                            -iregex \
                   ".*/.*\(${ALBUM}\|cover\|folder\|artwork\|front\).*[.]\(jpe?g\|png\|gif\|bmp\)" \; \
                   | sed 1q)"

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
