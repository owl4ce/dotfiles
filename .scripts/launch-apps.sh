#!/usr/bin/env sh

# The user's preferred applications launcher.
# https://github.com/owl4ce/dotfiles

# SPDX-License-Identifier: ISC

SYSTEM_LANG="$LANG"
export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

hold()
{
    # Parse user input options as $APP.
    APP="$(siq "${1}" "$APPS_FILE")"

    # Ensure $APP isn't empty.
    [ -n "$APP" ] || exit ${?}
}

# Single-execution options.
case "${1}" in
    -g) hold "${2}"

        # If the value of $APP contains double-quotes,
        # escape to preserve double-quotes when displayed to output.
        if [ -z "${APP##*\"*\"*}" ]; then
            ZAPP="$(sed -e '1s|"|\\"|g' <<- APP
						${APP}
					APP
                  )"
        fi

        # Display $ZAPP (fallback to $APP) to output.
        eval "echo \"${ZAPP:-${APP}}\""
    ;;
    * ) hold "${1}"

        # Execute $APP with user arguments.
        eval "LANG=\"$SYSTEM_LANG\" exec ${APP} \${*#\"${1}\"} >&2 &"
    ;;
esac

exit ${?}
