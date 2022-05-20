# Z shell initialization.
# https://github.com/owl4ce/dotfiles

# ENVIRONMENT VARIABLES
# ---
export PATH="${HOME}/.local/bin:${HOME}/.cargo/bin:${HOME}/.color-toys:${PATH}"

export GPG_TTY="$(tty)"

export BAT_THEME='base16'

export ZSH="${HOME}/.oh-my-zsh"

# OH-MY-ZSH
# ---
ZSH_THEME='ar-round'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

DISABLE_AUTO_UPDATE='true'
COMPLETION_WAITING_DOTS='true'
DISABLE_UNTRACKED_FILES_DIRTY='true'

plugins=( "zsh-autosuggestions" "zsh-completions" "zsh-syntax-highlighting" "bgnotify" )

# Always append history.
setopt INC_APPEND_HISTORY

# Execute oh-my-zsh.
source "${ZSH}/oh-my-zsh.sh"

# Speeds up pasting when using zsh-autosuggestions.
# See "https://github.com/zsh-users/zsh-autosuggestions/issues/238".
paste_init()
{
    OLD_SELF_INSERT="${${(s.:.)widgets[self-insert]}[2,3]}"
    zle -N self-insert url-quote-magic # I wonder if you'd need ".url-quote-magic"?
}
paste_done()
{
    zle -N self-insert "$OLD_SELF_INSERT"
}
zstyle :bracketed-paste-magic paste-init paste_init
zstyle :bracketed-paste-magic paste-finish paste_done

# ALIASES
# ---
PRIV="$(command -v doas || command -v sudo)"

# Hexdump alias.
alias hd='hexdump -C'

# Ping aliases.
alias ping_google='ping 8.8.8.8'
alias ping_cloudflare='ping 1.1.1.1'

# FileSystem TRIM alias.
alias trim_all="${PRIV} fstrim -va"

# Run text-editor as root aliases.
alias nanosu="${PRIV} nano"
alias nvimsu="${PRIV} nvim"

# Page caches cleaner alias.
alias cleanup_ram="${PRIV} sh -c 'sync && echo 3 > /proc/sys/vm/drop_caches'"

# Exa (modern `ls` replacement) aliases.
if [ -x "$(command -v exa)" ]; then
    alias ls='exa -lgh --icons --group-directories-first'
    alias la='exa -lgha --icons --group-directories-first'
fi

# Portage's emerge aliases.
if [ -x "$(command -v emerge)" ]; then
    alias emerge_install="${PRIV} emerge -av"
    alias emerge_install_unmask="${PRIV} emerge -av --autounmask=y --autounmask-write"
    alias emerge_pretend="${PRIV} emerge -pv"
    alias emerge_sync="${PRIV} emaint -a sync"
    alias emerge_changed_use="${PRIV} emerge -av --update --changed-use --deep @world"
    alias emerge_new_use="${PRIV} emerge -av --update --newuse --deep @world"
    alias emerge_depclean="${PRIV} emerge -av --depclean"
fi

# Gentoolkit's eclean aliases.
if [ -x "$(command -v eclean-dist)" ]; then
    alias eclean_dist="${PRIV} eclean-dist --deep"
    alias eclean_pkg="${PRIV} eclean-pkg --deep"
fi

# OpenRC aliases.
if [ -x "$(command -v rc-service)" ]; then
    alias rc-service="${PRIV} rc-service"
    alias rc-update="${PRIV} rc-update"
fi
