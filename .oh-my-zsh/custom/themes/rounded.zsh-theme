# Rounded minimal zsh theme
# Creator: owl4ce
# ----------------------------------
# https://github.com/owl4ce/dotfiles
# Requires Nerd Fonts for the icons

if [[ $UID -eq 0 ]]; then
    user_symbol="%F{8}%K{8}%F{1}%{%k%}%F{8}%f"
else
    user_symbol="%F{8}%K{8}%F{5}%{%k%}%F{8}%f"
fi

# Configuration
num_dirs=2 # Use 0 for full path
truncated_path="%F{8}%K{8}%F{4} %K{0} %F{white}%$num_dirs~%{%k%}%F{0}%f"
background_jobs="%(1j.%F{0}%K{0}%F{3}%{%k%}%F{0}%f.)"
non_zero_return_value="%(0?..%F{0}%K{0}%F{1}%{%k%}%F{0}%f)"

# Left part of prompt
PROMPT='$truncated_path $user_symbol '
# Right part of prompt
RPROMPT=' $background_jobs $non_zero_return_value'
# Input in bold
zle_highlight=(default:bold)
