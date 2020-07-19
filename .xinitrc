# Load Xresources
[[ -f ~/.Xresources ]] && xrdb ~/.Xresources

# Use QT5CT Settings for QT Themes
export QT_QPA_PLATFORMTHEME=qt5ct

# Mouse Accel
bash -c 'xset m 70/10 1 r rate 500 30 b on'

# SLiM Select Sessions login command
exec $1
