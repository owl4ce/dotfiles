<p align="center"><a name="top" href="#octocat-hi-there-thanks-for-visiting-"><img height="60%" width="100%" src="https://i.ibb.co/k4PbLjv/dotfiles.png"></a></p>

<p align="center">
<a href="#rice_scene--setup"><img width="120px" style="padding: 0 10px;" src="https://i.ibb.co/b5DYRxb/setup.png"></a>
<a href="https://github.com/owl4ce/dotfiles/wiki/Keybinds"><img width="120px" style="padding: 0 10px;" src="https://i.ibb.co/VVc5S9d/keybinds.png"></a>
<a href="https://www.deviantart.com/owl4ce/gallery/76024204/joyful-desktop-v3"><img width="120px" style="padding: 0 10px;" src="https://i.ibb.co/C1sdMw9/gallery.png"></a>
<a href="#memo--notes"><img width="120px" style="padding: 0 10px;" src="https://i.ibb.co/g75Z25g/notes.png"></a>
</p>

##  
### :octocat: Hi there! Thanks for visiting! <img alt="Visits" align="right" src="https://badges.pufler.dev/visits/owl4ce/dotfiles?style=flat-square&label=&color=success&logo=GitHub&logoColor=white&labelColor=373e4d"/>

<a href="https://www.deviantart.com/owl4ce/art/Minimal-Mode-862551236"><img src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/072e191f-a0a5-4be2-bc7a-55eb140b254f/de9jgsk-f66852c5-811c-46af-88d8-7db6de5855b4.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvMDcyZTE5MWYtYTBhNS00YmUyLWJjN2EtNTVlYjE0MGIyNTRmXC9kZTlqZ3NrLWY2Njg1MmM1LTgxMWMtNDZhZi04OGQ4LTdkYjZkZTU4NTViNC5wbmcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.hMZbKXsm1r074uq4Rb5x5c-lyo1QGz0kEnW-NhgPIRk" alt="preview" align="right" width="400px"></a>

This is my personal configuration for my favorite openbox window manager and some applications too.

I hope you understand everything here. :wink:

Here are some details about my setup:
- **WM**                           : [Openbox](http://openbox.org/wiki/Main_Page) :art: 4 changable themes / mode!
- **DM**                           : [SLiM](https://wiki.archlinux.org/index.php/SLiM) :blossom: beautiful UI! (optional)
- **Shell**                        : [Zsh](https://wiki.archlinux.org/index.php/zsh) :shell: with [oh my zsh](https://github.com/ohmyzsh/ohmyzsh) framework!
- **Terminal**                     : [URxvt](https://wiki.archlinux.org/index.php/Rxvt-unicode), [Termite](https://wiki.archlinux.org/index.php/Termite) (supported)
- **Openbox Menu**                 : [Obmenu-generator](https://github.com/trizen/obmenu-generator)
- **Panel**                        : [Tint2](https://wiki.archlinux.org/index.php/Tint2) :shaved_ice: material icon font!
- **Compositor**                   : [Picom](https://github.com/yshui/picom) / [Picom-rounded](https://github.com/ibhagwan/picom)
- **Notify Daemon**                : [Dunst](https://wiki.archlinux.org/index.php/Dunst) :leaves: minimalism!
- **Application Launcher**         : [Rofi](https://github.com/davatorium/rofi) :rocket: apps & sidebar menu!
- **File Manager**                 : [Thunar](https://wiki.archlinux.org/index.php/Thunar) :bookmark: customized sidebar & icon!
- **Text Editor**                  : [Geany](https://www.geany.org/), [nano](https://www.nano-editor.org/), [neovim](https://neovim.io/)

## :gift: Changelogs <img alt="Repo Size" align="right" src="https://github-size-badge.herokuapp.com/owl4ce/dotfiles.svg"/>
<a href="https://www.deviantart.com/owl4ce/art/Joyful-Desktop-v3-862516153"><img src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/072e191f-a0a5-4be2-bc7a-55eb140b254f/de9ipq1-10c7a4fd-ba9d-46ec-8193-559793ddc2c9.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvMDcyZTE5MWYtYTBhNS00YmUyLWJjN2EtNTVlYjE0MGIyNTRmXC9kZTlpcHExLTEwYzdhNGZkLWJhOWQtNDZlYy04MTkzLTU1OTc5M2RkYzJjOS5wbmcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.rg0jBXM8ozYxUuJqLe7Ogjdpzh2ZjdLWm-SJMkYTgk0" alt="" align="right" width="400px"></a>

[v3.0](https://youtu.be/sPBTRiuBLqU)
- **Visual Mode**:
  - Both modes (minimal) have their own window button styles, margins, sidebar rofi, and dunst layouts.
  - Removed eyecandy tint2 from Joyful Desktop v2
  - Better Tint2 (added temp executor, etc.)
  - Added rotation mode (crossover, except minimal mode.)
  
- **Major Changes**:
  - Removed SLiM sync background, custom slim themes, and unnecessary files/config.
  - All scripts are reproduced all with central variables in one [file](./.owl4ce_var). 
  - Reverse terminal background and foreground (urxvt/termite)
  - Nvim Config - Thanks to [@elenapan](https://github.com/elenapan/dotfiles)
  - SLiM Themes (optional) - See [here](#user-configuration)
  - URxvt Font Resizer - See [keybinds](https://github.com/owl4ce/dotfiles/wiki/Keybinds#urxvt)
  - Included [Networkmanager_dmenu](./.local/bin/networkmanager_dmenu)
  - Oh My ZSH Theme - [Rounded](./.oh-my-zsh/custom/themes/rounded.zsh-theme)
  - Rofi v1.6.0 Supported
  - New Ncmpcpp UI
  - Neofetch Images
  - New Wallpapers
  
## :rice_scene:  Setup
This is how to install these dotfiles for automatic settings OpenboxWM custom environment.

### Introduction of Linux Rice
Please read [this](https://crispgm.com/page/the-fascinating-arch-linux-rice.html) and [this](https://jie-fang.github.io/blog/basics-of-ricing).

### Detailed environment
Please refer to [wiki/Detailed-Environment](https://github.com/owl4ce/dotfiles/wiki/Detailed-Environment).

### Installation (dependencies)
  <details open>
  <summary><strong>Debian & Ubuntu (and all based distributions)</strong></summary>
  
  ```bash
  sudo apt install rsync python2 python psmisc wireless-tools openbox obconf alsa-utils brightnessctl nitrogen dunst tint2 gsimplecal rofi lxappearance qt5ct qt5-style-plugins lxpolkit xautolock rxvt-unicode xclip scrot thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman ffmpegthumbnailer tumbler w3m w3m-img geany viewnior mpv mpd mpc ncmpcpp pavucontrol parcellite neofetch htop zsh imagemagick ffmpeg playerctl xsettingsd
  ```

  </details>
  
  <details>
  <summary>oh-my-zsh & plugins</summary>
  
  - ```bash
    chsh -s /usr/bin/zsh # Change default shell to zsh for current user
    ```
  - ```bash
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    ```
  - ```bash
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    ```
  - ```bash
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    ```
  - [zsh-completions](https://software.opensuse.org/download.html?project=shells%3Azsh-users%3Azsh-completions&package=zsh-completions)
  
  </details>
  
  <details>
  <summary>picom</summary>
    
  - ```bash
    sudo apt install libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev  libpcre2-dev  libevdev-dev uthash-dev libev-dev libx11-xcb-dev
    ```
  - ```bash
    git clone https://github.com/yshui/picom.git && cd picom/
    ```
  - ```bash
    git submodule update --init --recursive
    ```
  - ```bash
    meson --buildtype=release . build
    ```
  - ```bash
    ninja -C build
    ```
  - ```bash
    ninja -C build install
    ```
    
    If you want rounded ones.
    > I don't recommend it, because I experience a memory leak.
  
  - ```bash
    sudo apt install libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev  libpcre2-dev  libevdev-dev uthash-dev libev-dev libx11-xcb-dev
    ```
  - ```bash
    git clone https://github.com/ibhagwan/picom.git && cd picom/
    ```
  - ```bash
    git submodule update --init --recursive
    ```
  - ```bash
    meson --buildtype=release . build
    ```
  - ```bash
    ninja -C build
    ```
  - ```bash
    ninja -C build install
    ```
    
  </details>

  <details>
  <summary>obmenu-generator</summary>
  
  > I haven't tested it yet.
  
  - ```bash
    sudo su
     ```
  - ```bash
    echo 'deb http://download.opensuse.org/repositories/home:/Head_on_a_Stick:/obmenu-generator/Debian_10/ /' > /etc/apt/sources.list.d/home:Head_on_a_Stick:obmenu-generator.list
    ```
  - ```bash
    wget -nv https://download.opensuse.org/repositories/home:Head_on_a_Stick:obmenu-generator/Debian_10/Release.key -O Release.key
    ```
  - ```bash
    apt-key add - < Release.key
    ```
  - ```bash
    apt update
    ```
  - ```bash
    apt install obmenu-generator libgtk2-perl
    ```
    
  - [See Installation from Git](https://github.com/trizen/obmenu-generator/blob/master/INSTALL.md)
  
  </details>
  
  <br>
  
  <details open>
  <summary><strong>Arch Linux (and all based distributions)</strong></summary>
  
  > Make sure your **AUR Helper** is *yay*.
  
  ```bash
  yay -S rsync python2 python psmisc wireless_tools openbox obconf alsa-utils brightnessctl nitrogen dunst tint2 gsimplecal rofi lxappearance qt5ct qt5-styleplugins lxsession xautolock rxvt-unicode-patched xclip scrot thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman ffmpegthumbnailer tumbler w3m geany viewnior mpv mpd mpc ncmpcpp pavucontrol parcellite neofetch htop picom obmenu-generator gtk2-perl zsh zsh-completions imagemagick ffmpeg playerctl xsettingsd
  ```
  If you want rounded corners, but I don't recommend it because I experience a memory leak.
  ```bash
  yay -S picom-ibhagwan-git
  ```
  
  </details>
  
  <details>
  <summary>oh-my-zsh & plugins</summary>
  
  - ```bash
    chsh -s /usr/bin/zsh # Change default shell to zsh for current user
    ```
  - ```bash
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    ```
  - ```bash
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    ```
  - ```bash
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    ```
  
  </details>
  
  <br>
  
  **Optional**: [gimp](https://www.gimp.org/), [nano](https://www.nano-editor.org/) + [nano syntax highlighting](https://github.com/scopatz/nanorc), [neovim](https://neovim.io/), [slim](https://wiki.archlinux.org/index.php/SLiM), [spotify](https://www.spotify.com/us/download/linux/), [termite](https://www.compuphase.com/software_termite.htm), [xfce4-power-manager](https://docs.xfce.org/xfce/xfce4-power-manager/getting-started).

### Installation (dotfiles)
  If you are already using v2, it is advisable to match the files in v2 and v3 then install the dotfiles files manually instead of putting all of them directly into the user homedir. Due to the many changes here, these suggestions are meant to avoid conflicts and remove files/config from v2 which were removed from v3.
  
  <details open>
  <summary><strong>Most of the files</strong></summary>
  
   You can clone or download it as a zip. After that put all files in the **dotfiles** folder to user's home directory.
   - ```bash
     git clone https://github.com/owl4ce/dotfiles.git && cd dotfiles
     ```
   - ```bash
     rsync -avzP --exclude '.git*' .* ~/
     ```
  
  </details>

  <details open>
  <summary><strong>Icons</strong></summary>
  
   - ```bash
     cd ~/.icons
     ```
   - ```bash
     tar -Jxvf Papirus-Custom.tar.xz && tar -Jxvf Papirus-Dark-Custom.tar.xz
     ```
   - ```bash
     sudo rsync -avzP Papirus-{Custom,Dark-Custom} /usr/share/icons/
     ```
   - ```bash
     rm -r ~/.icons/Papirus-* # Delete unnecessary files
     ```
     
  </details>

  <details open>
  <summary><strong>Refresh Font Cache</strong></summary>
  
   ```bash
   fc-cache -rv
   ```
    
  </details>

  <details open>
  <summary><strong>Root Privileges</strong></summary>
  
   - `poweroff`
   - `reboot`
   - `brightnessctl`
   - *others if needed*
   ```bash
   sudo chmod u+s $(which {poweroff,reboot,brightnessctl})
   ```
   > For `brightnessctl` I recommend [adding users to the group](https://wiki.archlinux.org/index.php/Users_and_groups#Group_management) `video`.
    
  </details>
    
### User configuration
- **SLiM Themes (optional)**
  
  <a href="https://www.deviantart.com/owl4ce/art/Floflo-Batik-SLiM-Themes-861519439"><img src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/072e191f-a0a5-4be2-bc7a-55eb140b254f/de8xcnj-d1413505-68ee-49bd-ba72-00cd3f2a2d9e.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvMDcyZTE5MWYtYTBhNS00YmUyLWJjN2EtNTVlYjE0MGIyNTRmXC9kZTh4Y25qLWQxNDEzNTA1LTY4ZWUtNDliZC1iYTcyLTAwY2QzZjJhMmQ5ZS5wbmcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.KPhW15Vepsxlr7San7OuBA_oyVfs-k7Bh1hCrbqC528" alt="floflo-batik" align="center" width="100%"></a>

- **Google-chrome / Chromium (tip)**

  <img src="https://i.ibb.co/4sqygH8/2020-10-15-023421-1366x768-scrot.png" alt="google-chrome.thumbnail" align="center" width="100%">

  **Settings**: `chrome://settings/`
  - Themes: `Use GTK+`
  - `Use system title bar and borders`
  
  **New Tab**
  - Extension: [Tabliss - A Beautiful New Tab](https://chrome.google.com/webstore/detail/tabliss-a-beautiful-new-t/hipekcciheckooncpjeljhnekcoolahp?hl=en)
  
  **Tabliss** -  Widgets Font
  - Greeting, Message: [Youth Touch DEMO](https://www.dafont.com/youth-touch.font)
  - Time, Search Box, Weather: [SFNS Display](https://fontsgeek.com/fonts/sfns-display-regular)

- **Spotify - Spicetify Theme (tip)**

  <img src="https://raw.githubusercontent.com/owl4ce/spicetify-themes/master/Dribbblish/mechanical.png" alt="spicetify.dribbblish-mechanical" align="center" width="100%">
  <img src="https://raw.githubusercontent.com/owl4ce/spicetify-themes/master/Dribbblish/eyecandy.png" alt="spicetify.dribbblish-eyecandy" align="center" width="100%">
  
  [Dribbblish](https://github.com/owl4ce/spicetify-themes/tree/master/Dribbblish#mechanical)
  
- **Battery Indicator** \
  Because on the tint2 panel I turned off the battery status. Alternatively, install `xfce4-power-manager` and turn it on [~/.config/openbox/autostart](./.config/openbox/autostart) then enable system tray icon in `xfce4-power-manager-settings`.
  
- **Dunst Action: Default Web Browser (`middle click`)** \
  [`~/.config/dunst/dunstrc-mech`](./.config/dunst/dunstrc-mech) \
  [`~/.config/dunst/dunstrc-mech-MINMOD`](./.config/dunst/dunstrc-mech-MINMOD) \
  [`~/.config/dunst/dunstrc-eyc`](./.config/dunst/dunstrc-eyc) \
  [`~/.config/dunst/dunstrc-eyc-MINMOD`](./.config/dunst/dunstrc-eyc-MINMOD)
  ```cfg
  ...
  
  42 browser = chromium
  
  ...
  ```
  
- **Screenshots, Tint2 Executor, and Autolock** \
  [`~/.owl4ce_var`](./.owl4ce_var)
  ```cfg
  ...
  
   95 #-------------------------------------------------------------------------#
   96 # TINT2 EXECUTOR                                                          #
   97 #-------------------------------------------------------------------------#
   98
   99 INT_ETH="enp4s0"
  100 INT_WIFI="wlp3s0"
  101
  102 TEMP_DEV="thermal_zone0"
  103
  104 #-------------------------------------------------------------------------#
  105 # SCREENSHOT OPTIONS                                                      #
  106 #-------------------------------------------------------------------------#
  107 # This will create "Screenshots" folder inside SAVE_DIR                   #
  108 #-------------------------------------------------------------------------#
  109
  110 SAVE_DIR="$HOME/Pictures"
  111 TIMER_SEC="5"
  112 
  113 #-------------------------------------------------------------------------#
  114 # XAUTOLOCK - 5 means 5 minutes                                           #
  115 #-------------------------------------------------------------------------#
  116 
  117 AUTOLOCK_MINUTE="5"
  
  ...
  ```
  > **TEMP_DEV**: Check here
  > ```bash
  > /sys/devices/virtual/thermal/
  > ```
  
- **Default Supported Apps** \
  [` ~/.scripts/default-apps/list`](./.scripts/default-apps/list)
  - **Terminal**: urxvt/termite
  - **Lockscreen**: anything
  - **Music Player**: mpd/spotify
  - **File Manager**: anything
  
  ```cfg
  1 terminal="urxvt"
  2 lockscreen="slimlock"
  3 musicpl="mpd"
  4 filemanager="thunar"
  ```
  
- **Tray** \
  [`~/.config/openbox/tray`](./.config/openbox/tray) \
  An example is turning on `nm-applet`, because by default I don't use it and use [networkmanager_dmenu](./.local/bin/networkmanager_dmenu) instead (<kbd>F12</kbd>). Remove hashtags before nm-applet.
  ```cfg
  1 #
  2 # This tray will restart after changing visual mode
  3 # Please add "&" after command
  4 #
  5 # ---
  6
  7 parcellite &
  8 #nm-applet &

  ```
  
- **URxvt Icon** \
  [`~/.Xresources`](./.Xresources)
  ```cfg
  ...
  
  17 URxvt.iconFile:                   /home/username/.icons/gladient/term.png
  
  ...
  ```
  
- **Neovim** \
  [`~/.config/nvim/`](./.config/nvim/) \
  You know what to do with [Vim-plug](https://github.com/junegunn/vim-plug).
  
- **MPD Music Directory** \
  [`~/.mpd/mpd.conf`](./.mpd/mpd.conf)
  ```cfg
  ...
  
  6 music_directory     "~/Music"
  
  ...
  ```
  
- **Ncmpcpp Music Directory** \
  Auto connect with MPD
  
  > **How to use ncmpcpp albumart?** \
  It's easy, put `album|cover|folder|artwork|front.jp?g|png|gif|bmp` into folder with song album. Recommended image size is *500px* ( **1:1** ) or more. [See keybinds](https://github.com/owl4ce/dotfiles/wiki/Keybinds#ncmpcpp)

- **Pulseaudio (without service)** \
  [`~/.config/openbox/autostart`](./.config/openbox/autostart) \
  This is optional for Linux distributions that don't use systemd as their init, actually pulseaudio can be triggered from increasing-decreasing the audio volume.
  ```cfg
  ...
  
  9  # there was once a pulseaudio here
  10 if [[ $(pstree) = *"pulseaudio"* ]]; then
  11   pulseaudio --start --log-target=syslog &
  12 fi
  
  ...
  ```

- **Neofetch Image (w3m)** \
  [`~/.config/neofetch/config.conf`](./.config/neofetch/config.conf`)
  ```cfg
  ...
  
  641 # Image Source
  642 #
  643 # Which image or ascii file to display.
  644 #
  645 # Default:  'auto'
  646 # Values:   'auto', 'ascii', 'wallpaper', '/path/to/img', '/path/to/ascii', '/path/to/dir/'
  647 #           'command output (neofetch --ascii "$(fortune | cowsay -W 30)")'
  648 # Flag:     --source
  649 #
  650 # NOTE: 'auto' will pick the best image source for whatever image backend is used.
  651 #       In ascii mode, distro ascii art will be used and in an image mode, your
  652 #       wallpaper will be used.
  653 #image_source="auto"
  654 #image_source="${HOME}/.config/neofetch/images/arch.png"
  655 #image_source="${HOME}/.config/neofetch/images/arch_dark.png"
  656 #image_source="${HOME}/.config/neofetch/images/artix.png"
  657 #image_source="${HOME}/.config/neofetch/images/bedrock.png"
  658 #image_source="${HOME}/.config/neofetch/images/gentoo.png"
  659 #image_source="${HOME}/.config/neofetch/images/gentoo_dark.png"
  660 image_source="${HOME}/.config/neofetch/images/lofi.png"
  661 #image_source="${HOME}/.config/neofetch/images/ubuntu.png"
  662 #image_source="${HOME}/.config/neofetch/images/ubuntu_dark.png"
  663 #image_source="${HOME}/.config/neofetch/images/void.png"
  664 #image_source="${HOME}/.config/neofetch/images/void_dark.png"
  
  ...
  ```
  <details open>
  <summary><strong>List</strong></summary>
  
  Arch|Gentoo|Ubuntu|Void
  |----|----|----|----|
  ![Arch](./.config/neofetch/images/arch.png)|![Gentoo](./.config/neofetch/images/gentoo.png)|![Ubuntu](./.config/neofetch/images/ubuntu.png)|![Void](./.config/neofetch/images/void.png)

  Arch Dark|Gentoo Dark|Ubuntu Dark|Void Dark
  |----|----|----|----|
  ![Arch](./.config/neofetch/images/arch_dark.png)|![Gentoo](./.config/neofetch/images/gentoo_dark.png)|![Ubuntu](./.config/neofetch/images/ubuntu_dark.png)|![Void](./.config/neofetch/images/void_dark.png)

  Artix|LoFi|Bedrock
  |---|---|---|
  ![Artix](./.config/neofetch/images/artix.png)|![LoFi](./.config/neofetch/images/lofi.png)|![Bedrock](./.config/neofetch/images/bedrock.png)
  
  </details>


## :memo:  Notes
### <p align="center">Color Scheme</p>
<p align="center"><a name="top" href="#color-scheme"><img src="https://i.ibb.co/9TDTqsy/color-scheme.png" alt="owl4ce.color-scheme" height="60%" width="100%"></a></p>

### <p align="center">:love_letter:</p>
<p align="center">Please don't underrate, I've configured them all since April 2020 and have been stuDYING them since <a href="https://github.com/owl4ce/dotfiles/wiki/My-Linux-Ricing-Journey">October 2019</a>. Awesome open-source. If you support it, star it or make a PR. Or if there is a problem with configuration you can make an issue here.</p><p align="center"><b>Thank you!</b></p>

[![Stargazers over time](https://starchart.cc/owl4ce/dotfiles.svg)](https://starchart.cc/owl4ce/dotfiles)

## :hearts:  Credits / Thanks
- [Openbox Wiki](http://openbox.org/wiki/Help:Themes)
- [Elenapan](https://github.com/elenapan)
- [Adhi Pambudi](https://github.com/addy-dclxvi)
- [Fikri Omar](https://github.com/fikriomar16)
- [Rizqi Nur Assyaufi](https://github.com/bandithijo)
- [Muktazam Hasbi Ashidiqi](https://github.com/reorr)
- [Ghani Rafif](https://github.com/ekickx)
- [Aditya Shakya](https://github.com/adi1090x)
- [Stark](https://github.com/stark) - [Color-Scripts](https://github.com/stark/Color-Scripts)
- [Ekaunt](https://github.com/ekaunt) - [Better promptmenu](https://github.com/owl4ce/dotfiles/pull/2)
- [HopeBaron](https://github.com/HopeBaron) - [Termite config](https://github.com/owl4ce/dotfiles/pull/4)
- [Themix-Project](https://github.com/themix-project) - [Oomox](https://github.com/themix-project/oomox)
- [Nana-4](https://github.com/nana-4) - [Materia-theme](https://github.com/nana-4/materia-theme)
- [Papirus Development Team](https://github.com/PapirusDevelopmentTeam) - [Papirus-icon-theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
- [Slava Levit](https://github.com/vlevit) - [Notify-send.sh](https://github.com/vlevit/notify-send.sh)
- [Scott Hansen](https://github.com/firecat53) - [Networkmanager_dmenu](https://github.com/firecat53/networkmanager-dmenu)
- Our local linux community [Linuxer Desktop Art](https://web.facebook.com/groups/linuxart) and [r/unixporn](https://www.reddit.com/r/unixporn/).
- © All artists who make icons, illustrations, and wallpapers.
