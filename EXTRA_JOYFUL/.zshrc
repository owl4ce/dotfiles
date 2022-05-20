# Z shell initialization.
# https://github.com/owl4ce/dotfiles

# GENERAL
# ---
# System path.
export PATH="${HOME}/.cargo/bin:${HOME}/.color-toys:${HOME}/.local/bin:${PATH}"
# Bat (a cat(1) clone with wings) theme.
export BAT_THEME='base16'
# GPG tty.
export GPG_TTY="${TTY:-$(tty)}"
# Authority delegator.
PRIV="$(command -v doas || command -v sudo)"

# (OH-MY-)ZSH
# ---
# Installation directory path.
export ZSH="${HOME}/.oh-my-zsh"
# Theme to load.
ZSH_THEME='ar-round'
# Highlight styling for zsh-autosuggestions.
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS='true'
# Disable marking untracked files under VCS as dirty.
DISABLE_UNTRACKED_FILES_DIRTY='true'
# Disable automatic updates.
zstyle ':omz:update' mode disabled
# Plugins to load.
plugins=(bgnotify zsh-autosuggestions zsh-completions fast-syntax-highlighting)
# Always append history.
setopt INC_APPEND_HISTORY
# Execute OMZ.
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
# Hexdump alias.
alias hd='hexdump -C'
# Ping aliases.
alias ping_google='ping 8.8.8.8'
alias ping_cloudflare='ping 1.1.1.1'
# Filesystem TRIM alias.
alias trim_all='${PRIV##*/} fstrim -va'
# Text-editor aliases.
alias nanosu='${PRIV##*/} nano'
alias nvimsu='${PRIV##*/} nvim'
# Page-cache cleaner alias.
alias cleanup_ram="\${PRIV##*/} sh -c 'sync; echo 3 >/proc/sys/vm/drop_caches'"
# Exa (a modern replacement for ‘ls’) aliases.
if [ -x "$(command -v exa)" ]; then
    alias ls='exa -lgh --icons --group-directories-first'
    alias la='exa -lgha --icons --group-directories-first'
fi
# Portage aliases.
if [ -x "$(command -v emerge)" ]; then
    alias emerge_install='${PRIV##*/} emerge -av'
    alias emerge_install_unmask='${PRIV##*/} emerge -av --autounmask=y --autounmask-write'
    alias emerge_pretend='${PRIV##*/} emerge -pv'
    alias emerge_sync='${PRIV##*/} emaint -a sync'
    alias emerge_changed_use='${PRIV##*/} emerge -av --update --changed-use --deep @world'
    alias emerge_new_use='${PRIV##*/} emerge -av --update --newuse --deep @world'
    alias emerge_depclean='${PRIV##*/} emerge -av --depclean'
fi
# Gentoolkit aliases.
if [ -x "$(command -v eclean-dist)" ]; then
    alias eclean_dist='${PRIV##*/} eclean-dist --deep'
    alias eclean_pkg='${PRIV##*/} eclean-pkg --deep'
fi
# OpenRC aliases.
if [ -x "$(command -v rc-service)" ]; then
    alias rc-service='${PRIV##*/} rc-service'
    alias rc-update='${PRIV##*/} rc-update'
fi
