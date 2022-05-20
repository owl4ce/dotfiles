# Minimal Arrow-Rounded ZSH Theme.
# Author: owl4ce <alternate-se7en@pm.me>
# Requires Nerd Fonts for the glyphs.
# -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-
# https://github.com/owl4ce/dotfiles

if [ "${EUID:-$(id -u)}" -eq 0 ]; then
    #user_symbol="%F{1}%Bλ%b%f" # lambda
    user_symbol="%F{1}%f"      # arrow
else
    #user_symbol="%F{5}%Bλ%b%f" # lambda
    user_symbol="%F{5}%f"      # arrow
fi

# CONFIGURATION
# ---
num_dirs=2 # Use 0 to show full path.
dir_path="%F{0}%K{0}%F{white}%$num_dirs~ %K{8} %F{4}%{%k%}%F{8}%f"
background_jobs="%(1j.%F{2}%f.)"
non_zero_return_value="%(0?..%F{1}%f)"

# LEFT PROMPT
# ---
PROMPT='$(git_prompt_info) $user_symbol '
# RIGHT PROMPT
# ---
RPROMPT=' $background_jobs $non_zero_return_value $dir_path'
# BOLD INPUT
# ---
zle_highlight=(default:bold)

# GIT PROMPT
# ---
ZSH_THEME_GIT_PROMPT_PREFIX="%F{8}%K{8}%F{4} %K{0} %F{white}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%k%}%F{0}%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{1}*%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""
