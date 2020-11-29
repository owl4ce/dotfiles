<p align="center"><a name="top" href="#octocat-hi-there-thanks-for-visiting-"><img height="60%" width="100%" src="https://i.ibb.co/k4PbLjv/dotfiles.png"></a></p>

<p align="center">
<a href="#rice_scene--setup"><img width="120px" style="padding: 0 10px;" src="https://i.ibb.co/b5DYRxb/setup.png"></a>
<a href="https://github.com/owl4ce/dotfiles/wiki/Keybinds"><img width="120px" style="padding: 0 10px;" src="https://i.ibb.co/VVc5S9d/keybinds.png"></a>
<a href="https://www.deviantart.com/owl4ce/gallery/76024204/joyful-desktop-v3"><img width="120px" style="padding: 0 10px;" src="https://i.ibb.co/C1sdMw9/gallery.png"></a>
<a href="#memo--notes"><img width="120px" style="padding: 0 10px;" src="https://i.ibb.co/g75Z25g/notes.png"></a>
</p>

##  
### :octocat: Hi there! Thanks for visiting! <img alt="Visits" align="right" src="https://badges.pufler.dev/visits/owl4ce/dotfiles?style=flat-square&label=&color=success&logo=GitHub&logoColor=white&labelColor=373e4d"/>

<a href="ttps://www.deviantart.com/owl4ce/art/Minimal-Mode-862551236"><img src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/072e191f-a0a5-4be2-bc7a-55eb140b254f/de9jgsk-f66852c5-811c-46af-88d8-7db6de5855b4.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvMDcyZTE5MWYtYTBhNS00YmUyLWJjN2EtNTVlYjE0MGIyNTRmXC9kZTlqZ3NrLWY2Njg1MmM1LTgxMWMtNDZhZi04OGQ4LTdkYjZkZTU4NTViNC5wbmcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.hMZbKXsm1r074uq4Rb5x5c-lyo1QGz0kEnW-NhgPIRk" alt="preview" align="right" width="400px"></a>

This is my personal configuration for my favorite openbox window manager and some applications too.

I hope you understand everything here. :wink:

Here are some details about my setup:
- **WM**                           : [Openbox](http://openbox.org/wiki/Main_Page) :art: 4 changable themes/mode!
- **DM**                           : [SLiM](https://wiki.archlinux.org/index.php/SLiM) :blossom: beautiful UI!
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

*v3.0*
- **Visual Mode**:
  - Both modes (minimal) have their own window button styles, margins, sidebar rofi, and dunst layouts.
  - Removed eyecandy tint2 from Joyful Desktop v2
  - Better Tint2 (added temp executor, etc.)
  - Added rotation mode (crossover)
  
- **Major Changes**:
  - Removed SLiM sync background, custom slim themes, and unnecessary files/config.
  - All scripts are reproduced all with central variables in one [file](./.owl4ce_var). 
  - Reverse terminal background and foreground (urxvt/termite)
  - Nvim Config - Thanks to [@elenapan](https://github.com/elenapan/dotfiles)
  - URxvt Font Resizer - See [keybinds](https://github.com/owl4ce/dotfiles/wiki/Keybinds#urxvt)
  - Included [Networkmanager_dmenu](./.local/bin/networkmanager_dmenu)
  - Oh My ZSH Theme - [Rounded](./.oh-my-zsh/custom/themes/rounded.zsh-theme)
  - SLiM Themes - See [here](#user-configuration)
  - Rofi v1.6.0 Supported
  - New Ncmpcpp UI
  - Neofetch Images
  - New Wallpapers
  
## :rice_scene:  Setup
This is how to install this dotfiles for openbox automated setup.

### Introduction of Linux Rice
Please read [this](https://crispgm.com/page/the-fascinating-arch-linux-rice.html) and [this](https://jie-fang.github.io/blog/basics-of-ricing).

### Installation (dependencies)
  <details open>
  <summary><strong>Debian & Ubuntu (and all based distributions)</strong></summary>
  
  ```bash
  sudo apt install python2 psmisc wireless-tools openbox obconf alsa-utils brightnessctl nitrogen dunst tint2 gsimplecal rofi lxappearance qt5ct qt5-style-plugins lxpolkit xautolock rxvt-unicode xclip scrot thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman ffmpegthumbnailer tumbler w3m w3m-img geany nano viewnior mpd mpc ncmpcpp pavucontrol parcellite neofetch htop zsh ffmpeg playerctl xsettingsd
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
  yay -S python2 psmisc wireless_tools openbox obconf alsa-utils brightnessctl nitrogen dunst tint2 gsimplecal rofi lxappearance qt5ct qt5-styleplugins lxsession xautolock rxvt-unicode-patched xclip scrot thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman ffmpegthumbnailer tumbler w3m geany nano viewnior mpd mpc ncmpcpp pavucontrol parcellite neofetch htop picom obmenu-generator gtk2-perl zsh zsh-completions imagemagick ffmpeg playerctl xsettingsd
  ```
  If you want rounded windows, but I don't recommend it because I experience a memory leak.
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
  
  **Optional**: [gimp](https://www.gimp.org/), [improved nano syntax highlighting](https://github.com/scopatz/nanorc), [mpv](https://mpv.io/), [neovim](https://neovim.io/), [slim](https://wiki.archlinux.org/index.php/SLiM), [spotify](https://www.spotify.com/us/download/linux/), [termite](https://www.compuphase.com/software_termite.htm), [xfce4-power-manager](https://docs.xfce.org/xfce/xfce4-power-manager/getting-started), [zathura](https://pwmt.org/projects/zathura/).

### Detailed environment
Please refer to [wiki/Detailed-Environment](https://github.com/owl4ce/dotfiles/wiki/Detailed-Environment).

### Installation (dotfiles)
  If you are already using v2, it is advisable to match the files in v2 and v3 then install the dotfiles files manually instead of putting all of them directly into the user homedir. Due to the many changes here, these suggestions are meant to avoid conflicts and remove files/config from v2 which were removed from v3.
  
  <details open>
  <summary><strong>Most of the files</strong></summary>
  
   You can clone or download it as a zip. After that put all files in the **dotfiles** folder to user's home directory or ( **~** ).
   - ```bash
     git clone https://github.com/owl4ce/dotfiles.git
     ```
   - ```bash
     cd dotfiles/ && cp -r {.*,*} ~/
     ```
   - ```bash
     rm -rf ~/{README.md,LICENSE,.git} # Delete unnecessary files
     ```
   
  </details>

  <details open>
  <summary><strong>Icons</strong></summary>
  
   - ```bash
     cd ~/.icons/
     ```
   - ```bash
     tar -Jxvf Papirus-Custom.tar.xz && tar -Jxvf Papirus-Dark-Custom.tar.xz
     ```
   - ```bash
     sudo cp -r {Papirus-Custom,Papirus-Dark-Custom} /usr/share/icons/
     ```
   - ```bash
     rm -r ~/.icons/{Papirus-Custom,Papirus-Dark-Custom,*.tar.xz} # Delete unnecessary files
     ```
     
   </details>

For refresh font cache do
```bash
fc-cache -rv
```

### User configuration
- **SLiM Themes**
  
  <img src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/072e191f-a0a5-4be2-bc7a-55eb140b254f/de8xcnj-ab1d83c2-591f-4af5-8cd3-7cca470b003c.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvMDcyZTE5MWYtYTBhNS00YmUyLWJjN2EtNTVlYjE0MGIyNTRmXC9kZTh4Y25qLWFiMWQ4M2MyLTU5MWYtNGFmNS04Y2QzLTdjY2E0NzBiMDAzYy5wbmcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.L3u8o56igDJEb2od0AXm_JpBAtzBSU7kg3wOPq3GL34" alt="floflo-batik" align="center" width="100%">
  
  Wait for 30 stars, I will upload the file and make a guide [here](https://www.deviantart.com/owl4ce/art/Floflo-Batik-SLiM-Themes-861519439).
  
- **Google-chrome / Chromium (tip)**

  <img src="https://i.ibb.co/4sqygH8/2020-10-15-023421-1366x768-scrot.png" alt="google-chrome.thumbnail" align="center" width="100%">

  **Settings**: `chrome://settings/`
  - Themes: `Use GTK+`
  - `Use system title bar and borders`
  
  **New Tab**
  - Extension**: [Tabliss - A Beautiful New Tab](https://chrome.google.com/webstore/detail/tabliss-a-beautiful-new-t/hipekcciheckooncpjeljhnekcoolahp?hl=en)
  
  **Tabliss** -  Widgets Font
  - Greeting, Message: [Youth Touch DEMO](https://www.dafont.com/youth-touch.font)
  - Time, Search Box, Weather: [SFNS Display](https://fontsgeek.com/fonts/sfns-display-regular)

- **Spotify - Spicetify Theme (tip)**

  <img src="https://raw.githubusercontent.com/owl4ce/spicetify-themes/master/Dribbblish/mechanical.png" alt="spicetify.dribbblish-mechanical" align="center" width="100%">
  <img src="https://raw.githubusercontent.com/owl4ce/spicetify-themes/master/Dribbblish/eyecandy.png" alt="spicetify.dribbblish-eyecandy" align="center" width="100%">
  
  [Dribbblish](https://github.com/owl4ce/spicetify-themes/tree/master/Dribbblish#mechanical)
  
- **Battery Indicator** \
  Because on the tint2 panel I turned off the battery status. Alternatively, install xfce4-power-manager and turn it on *~/.config/openbox/autostart* then enable system tray icon in xfce4-power-manager-settings.
  
- **Dunst Action: Default Web Browser (`middle click`)** \
  `~/.config/dunst/dunstrc-mech` \
  `~/.config/dunst/dunstrc-mech-MINMOD` \
  `~/.config/dunst/dunstrc-eyc` \
  `~/.config/dunst/dunstrc-eyc-MINMOD`
  ```cfg
  ...
  
  42 browser = chromium
  
  ...
  ```
  
- **Screenshots & Tint2 Executor** \
  `~/.owl4ce_var`
  ```cfg
  ...
  
   92 #-------------------------------------------------------------------------#
   93 # TINT2 EXECUTOR                                                          #
   94 #-------------------------------------------------------------------------#
   95
   96 INT_ETH="enp4s0"
   97 INT_WIFI="wlp3s0"
   98
   99 TEMP_DEV="thermal_zone0"
  100
  101 #-------------------------------------------------------------------------#
  102 # SCREENSHOT OPTIONS                                                      #
  103 #-------------------------------------------------------------------------#
  104 # This will create "Screenshots" folder inside SAVE_DIR                   #
  105 #-------------------------------------------------------------------------#
  106
  107 SAVE_DIR="$HOME/Pictures"
  108 TIMER_SEC="5"
  
  ...
  ```
  > **TEMP_DEV**: Check here
  > ```bash
  > /sys/devices/virtual/thermal/
  > ```
  
- **Root Privileges ([SUID](https://en.wikipedia.org/wiki/Setuid))**
  - `poweroff`
  - `reboot`
  - `brightnessctl`
  - *others if needed*
  ```bash
  sudo chmod u+s $(where {poweroff,reboot,brightnessctl})
  ```
  > For `brightnessctl` I recommend [adding users to the group](https://wiki.archlinux.org/index.php/Users_and_groups#Group_management) `video`.
  
- **Default Supported Apps** \
  `~/.config/openbox/lockscreen`
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
  `~/.config/openbox/tray`
  
- **URxvt Icon** \
  `~/.Xresources`
  ```cfg
  ...
  
  17 URxvt.iconFile:                   /home/username/.icons/gladient/term.png
  
  ...
  ```
  
- **Neovim** \
  You know what to do with [Vim-plug](https://github.com/junegunn/vim-plug).
  
- **MPD Music Directory** \
  `~/.mpd/mpd.conf`
  ```cfg
  ...
  
  6 music_directory     "~/Music"
  
  ...
  ```
  
- **Ncmpcpp Music Directory** \
  Auto connect with MPD
  
  > **How to use ncmpcpp albumart?** \
  It's easy, put `album|cover|folder|artwork|front.jp?g|png|gif|bmp` into folder with song album. Recommended image size is *500px* ( **1:1** ) or more. [See keybinds](https://github.com/owl4ce/dotfiles/wiki/Keybinds#ncmpcpp)

- **Neofetch Image (w3m)** \
  `~/.config/neofetch/config.conf`
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
Arch|Artix|Bedrock|Gentoo|LoFi|Ubuntu|Void
|-------|-------|-------|-------|-------|-------|-------|
![Arch](./.config/neofetch/images/arch.png)|![Artix](./.config/neofetch/images/artix.png)|![Bedrock](./.config/neofetch/images/bedrock.png)|![Gentoo](./.config/neofetch/images/gentoo.png)|![LoFi](./.config/neofetch/images/lofi.png)|![Ubuntu](./.config/neofetch/images/ubuntu.png)|![Void](./.config/neofetch/images/void.png)

Arch Dark|Gentoo Dark|Ubuntu Dark|Void Dark
|----|----|----|----|
![Arch](./.config/neofetch/images/arch_dark.png)|![Gentoo](./.config/neofetch/images/gentoo_dark.png)|![Ubuntu](./.config/neofetch/images/ubuntu_dark.png)|![Void](./.config/neofetch/images/void_dark.png)

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
