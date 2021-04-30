# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ar-round"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-autosuggestions zsh-completions zsh-syntax-highlighting bgnotify)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
setopt INC_APPEND_HISTORY
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Aliases
#alias ls="colorls --sd -A"

# owl4ce s preferences
PRIV="doas"

alias c="clear"
alias q="exit"
alias hd="hexdump -C"
alias default-apps="printf '\ec'; $HOME/.scripts/default-apps/launch; $HOME/.scripts/default-apps/launch -e"
alias pacrem="$PRIV pacman -Rcns"
alias yayupd="yay -Sy"
alias yayupg="yay -Syu"
alias emergeins="$PRIV emerge -av"
alias emergeinmask="$PRIV emerge -av --autounmask=y --autounmask-write"
alias emergepv="$PRIV emerge -pv"
alias emergeupd="$PRIV emaint -a sync"
alias emergeupg="$PRIV emerge -av --update --deep --changed-use @world"
alias emergedepc="$PRIV emerge --depclean -av"
alias emergenuse="$PRIV emerge -av --update --newuse --deep @world"
alias emergecuse="$PRIV emerge -av --update --changed-use --deep @world"
alias ecleandist="$PRIV eclean-dist --deep"
alias ecleanpkg="$PRIV eclean-pkg --deep"
alias ecleankern="$PRIV eclean-kernel -n 3"
alias rc-service="$PRIV rc-service"
alias rc-update="$PRIV rc-update"
alias pingoogle="ping 8.8.8.8"
alias trimall="$PRIV fstrim -va"
alias nanosu="$PRIV nano"
alias nvimsu="$PRIV nvim"
alias refram="$PRIV sh -c 'sync; echo 3 > /proc/sys/vm/drop_caches'"
#alias ls="exa -lgh --icons --group-directories-first"
#alias la="exa -lgha --icons --group-directories-first"

# Color toys aliases
alias 256colors2="$HOME/.color-toys/256colors2.pl"
alias bloks="$HOME/.color-toys/bloks"
alias colortest="$HOME/.color-toys/colortest"
alias colortest-slim="$HOME/.color-toys/colortest-slim"
alias colorview="$HOME/.color-toys/colorview"
alias colorbars="$HOME/.color-toys/colorbars"
alias panes="$HOME/.color-toys/panes"
alias pipes1="$HOME/.color-toys/pipes1"
alias pipes2="$HOME/.color-toys/pipes2"
alias pipes2-slim="$HOME/.color-toys/pipes2-slim"

# GPG Dialog
export GPG_TTY=$(tty)

# BAT Theme (cat replacement)
export BAT_THEME="base16"
