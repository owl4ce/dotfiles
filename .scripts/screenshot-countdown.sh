#!/usr/bin/env sh

# Take screenshot by countdown in seconds of available screens.
# https://github.com/owl4ce/dotfiles

export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

[ -x "$(command -v scrot)" ] || exec dunstify 'Install `scrot`!' -r 74 -u low

{
    sleep .21s

    while :; do
        if [ "$SS_CP2CLP" = 'yes' -a -x "$(command -v xclip)" ]; then
            CLIP='xclip -selection clipboard -target image/png -i $f;'
            STS2='\nCLIPBOARD'
            break
        elif [ "$SS_SAVE" != 'yes' ]; then
            SS_CP2CLP='yes'
        else
            break
        fi
    done

    if [ "$SS_SAVE" = 'yes' ]; then
        [ -d "${SS_SVDIR}/Screenshots" ] || install -d "${SS_SVDIR}/Screenshots"
        EXEC="${CLIP} mv -f \$f \"${SS_SVDIR}/Screenshots/\""
        STS1="${SS_SVDIR##*/}/Screenshots"
    else
        EXEC="${CLIP} rm -f \$f"
        STS2='CLIPBOARD'
    fi

    [ "$SS_POINTER" != 'yes' ] || ARGS='-p'

    dunstify '' "Taken in ${SS_COUNTDOWN_SECONDS:-5}s .." -i "$SCREENSHOT_ICON" -r 74 -t 1000

    scrot ${ARGS} -d "${SS_COUNTDOWN_SECONDS:-5}" \
                  -e "$EXEC" \
                  -q "${SS_QUALITY:-75}" \
                  -z \
    || exec dunstify '' 'Screenshot failed!' -i "$SCREENSHOT_ICON" -r 74 -u low

    exec dunstify '' "<span size='small'><u>${STS1}</u><i>${STS2}</i></span>\nPicture obtained!" \
                  -i  "$SCREENSHOT_ICON" -r 74 -u low
} &

exit ${?}
