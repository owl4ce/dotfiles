#!/usr/bin/env sh

# The user's preferred applications launcher.
# https://github.com/owl4ce/dotfiles

SYSTEM_LANG="$LANG"
export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

hold()
{
    APP="$(siq "${@}" "$APPS_FILE")"
    [ -n "$APP" ] || exit ${?}
}

case "${1}" in
    '') X='\033[0m' g='\033[0;32m' m='\033[0;35m' r='\033[0;31m'

        while IFS= read -r STRING; do
            N=$((N+1))
            printf "%b\n%b\n" \
                   "${m}[${X}${N}${m}] ${r}${STRING%%\ *}${X}" \
                   "-${g}x${X}- $("${0}" -g "${STRING%%\ *}")"
        done <"$APPS_FILE"
    ;;
    -g) hold "${2}"
        echo "$APP"
    ;;
    **) hold "${1}"
        exec $(LANG="$SYSTEM_LANG" ${APP} ${@#${1}} >&2 &)
    ;;
esac

exit ${?}
