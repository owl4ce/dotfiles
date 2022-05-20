#!/usr/bin/env sh

# The user's preferred applications launcher.
# https://github.com/owl4ce/dotfiles

# shellcheck disable=SC3058

SYSTEM_LANG="$LANG"
export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

hold()
{
    APP="$(siq "${1}" "$APPS_FILE")"
    [ -n "$APP" ] || exit ${?}
}

case "${1}" in
    '') X='\033[0m' g='\033[0;32m' m='\033[0;35m' r='\033[0;31m'

        while IFS= read -r STRING; do
            N=$((N+1))
            printf '%b\n' "${m}[${X}${N}${m}] ${r}${STRING%%\ *}${X}" \
                          "-${g}x${X}- $("${0}" -g "${STRING%%\ *}")"
        done <"$APPS_FILE"
    ;;
    -g) hold "${2}"

        if [ -z "${APP##*\"*\"*}" ]; then
            ZAPP="$(sed -e '1s|"|\\"|g' <<- APP
						${APP}
					APP
                  )"
        fi

        eval "echo \"${ZAPP:-${APP}}\""
    ;;
    **) hold "${1}"

        eval "LANG=\"$SYSTEM_LANG\" exec ${APP} ${*#"${1}"} >&2 &"
    ;;
esac

exit ${?}
