#!/usr/bin/env zsh

# FILE: ~/.zshrc
# -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-
# DESC: Z shell initialization.
# -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-
# aHR0cHM6Ly9naXRodWIuY29tL293bDRjZS9kb3RmaWxlcwo=

# If you come from bash you might have to change your PATH.
export PATH="${HOME}/.local/bin:${HOME}/.cargo/bin:${HOME}/.color-toys:${PATH}"

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load.
# If set to "random", it will load a random theme each time oh-my-zsh is loaded,
# in which case to know which specific one was loaded, run `echo $RANDOM_THEME`.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ar-round"

# Set list of themes to pick from when loading at random.
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line to disable marking untracked files under VCS as dirty.
# This makes repository status check for large repositories much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in "~/.oh-my-zsh/plugins".
# Custom plugins may be added to "~/.oh-my-zsh/custom/plugins".
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-autosuggestions zsh-completions zsh-syntax-highlighting bgnotify)

# zsh-autosuggestions highlight color.
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

# Store zsh-history in real-time.
setopt INC_APPEND_HISTORY

# Execute oh-my-zsh.
source "${ZSH}/oh-my-zsh.sh"

# GnuPG dialog.
export GPG_TTY="$(tty)"

# Bat (`cat` with wings) theme.
export BAT_THEME="base16"

# Speeds up pasting when using zsh-autosuggestions.
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
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

# Set aliases, overriding those provided by oh-my-zsh libs, plugins, and themes.
# For a full list of active aliases, run `alias`.

# Authority delegator, `doas` or `sudo`.
PRIV="$(command -v doas || command -v sudo)"

# Hexdump alias.
alias hd="hexdump -C"

# Ping aliases.
alias ping_google="ping 8.8.8.8"
alias ping_cloudflare="ping 1.1.1.1"

# FileSystem TRIM alias.
alias trim_all="${PRIV} fstrim -va"

# Run editor as root aliases.
alias nanosu="${PRIV} nano"
alias nvimsu="${PRIV} nvim"

# Page caches cleaner alias.
alias cleanup_ram="${PRIV} sh -c 'sync && echo 3 > /proc/sys/vm/drop_caches'"

# Exa (modern `ls` replacement) aliases.
if [ -x "$(command -v exa)" ]; then
    alias ls="exa -lgh --icons --group-directories-first"
    alias la="exa -lgha --icons --group-directories-first"
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
