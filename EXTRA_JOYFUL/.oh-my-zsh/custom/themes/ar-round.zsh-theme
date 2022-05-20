# Minimal arrow-rounded (OH-MY-)ZSH theme.
# https://github.com/owl4ce/dotfiles

# User's left prompt symbol.
if [ "${EUID:-$(id -u)}" -eq 0 ]; then
   #user_symbol='%F{1}%Bλ%b%f' # lambda
    user_symbol='%F{1}%f'     # arrow
else
   #user_symbol='%F{5}%Bλ%b%f' # lambda
    user_symbol='%F{5}%f'     # arrow
fi

# Return code prompt.
non_zero_return_value="%(0?..%F{1}%f)"

# Background prompt.
background_jobs="%(1j.%F{2}%f.)"

# Current working directory prompt, use '%0~' to show full path.
dir_path="%F{0}%K{0}%F{white}%2~ %K{8} %F{4}%{%k%}%F{8}%f"

# Use bold input.
zle_highlight=(default:bold)

# L/R prompt.
PROMPT='$(git_prompt_info) ${user_symbol} '
RPROMPT=' ${background_jobs} ${non_zero_return_value} ${dir_path}'

# GIT prompt.
ZSH_THEME_GIT_PROMPT_PREFIX="%F{8}%K{8}%F{4} %K{0} %F{white}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%k%}%F{0}%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{1}*%f"
ZSH_THEME_GIT_PROMPT_CLEAN=''
