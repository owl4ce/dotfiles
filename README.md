<p align="center"><a name="top" href="#octocat-hi-there-thanks-for-visiting"><img height="60%" width="100%" src="https://i.ibb.co/k4PbLjv/dotfiles.png"></a></p>

<p align="center">
<a href="#rice_scene--setup"><img width="120px" style="padding: 0 10px;" src="https://i.ibb.co/b5DYRxb/setup.png"></a>
<a href="https://github.com/owl4ce/dotfiles/wiki/Keybinds"><img width="120px" style="padding: 0 10px;" src="https://i.ibb.co/VVc5S9d/keybinds.png"></a>
<a href="https://github.com/owl4ce/dotfiles/wiki/Gallery"><img width="120px" style="padding: 0 10px;" src="https://i.ibb.co/C1sdMw9/gallery.png"></a>
<a href="#memo--notes"><img width="120px" style="padding: 0 10px;" src="https://i.ibb.co/g75Z25g/notes.png"></a>
</p>

##  
### :octocat: Hi there! Thanks for visiting!

<a href="https://youtu.be/BrivcfEEAqs"><img src="https://i.ibb.co/jkFJDw8/SLi-M-CHESS.gif" alt="thumbnail" align="right" width="400px"></a>

This is my personal configuration for my favorite openbox window manager and some applications too.

I hope you understand everything here. :wink:

Here are some details about my setup:
- **WM**                           : [Openbox](http://openbox.org/wiki/Main_Page) :art: 4 changable themes/mode!
- **DM**                           : [SLiM](https://wiki.archlinux.org/index.php/SLiM) :blossom: login themes Mac looks like!
- **Shell**                        : [Zsh](https://wiki.archlinux.org/index.php/zsh) :shell: with [oh my zsh](https://github.com/ohmyzsh/ohmyzsh) framework!
- **Terminal**                     : [URxvt](https://wiki.archlinux.org/index.php/Rxvt-unicode), [Termite](https://wiki.archlinux.org/index.php/Termite)
- **Openbox Menu**                 : [Obmenu-generator](https://github.com/trizen/obmenu-generator)
- **Panel**                        : [Tint2](https://wiki.archlinux.org/index.php/Tint2) :shaved_ice: material icon font!
- **Compositor**                   : [Picom](https://github.com/yshui/picom)
- **Notify Daemon**                : [Dunst](https://wiki.archlinux.org/index.php/Dunst) :leaves: minimalism!
- **Application Launcher**         : [Rofi](https://github.com/davatorium/rofi) :rocket: apps & sidebar menu!
- **File Manager**                 : [Thunar](https://wiki.archlinux.org/index.php/Thunar) :bookmark: customized sidebar & icon!
- **Text Editor**                  : [Geany](https://www.geany.org/), [nano](https://www.nano-editor.org/), [vim](https://www.vim.org/)

## :gift: Changelogs
<img src="https://i.ibb.co/92bZ9Br/2020-09-19-183802-1366x768-scrot.png" alt="google-chrome.thumbnail" align="right" width="400px">

- **UI Enlargement**: Fonts, etc. - [See gallery](https://github.com/owl4ce/dotfiles/wiki/Gallery)
- **GTK+ Theme**: Google-chrome / Chromium - [See tip](#some-user-configuration)
- **New Scripts**:
  - [Openbox button style changer](./.config/openbox/visual-mode/obch)
  - [MPD track change detector](./.ncmpcpp/scripts/track-change-detector)
- **New Icons**: [Gladient](https://play.google.com/store/apps/details?id=com.maxghani.gladient&hl=en) ( **©** )
- **New Wallpapers** (can be [added](./.wallpaper/) by yourself)
- **Ncmpcpp**: New looks
- **SLiM**: New looks
- **Major Changes**: Reconfigure all files (scripting algorithms, etc.)

## :rice_scene:  Setup
This is how to install this dotfiles for openbox automated setup.

### Introduction of Linux Rice
Please read [this](https://crispgm.com/page/the-fascinating-arch-linux-rice.html) and [this](https://jie-fang.github.io/blog/basics-of-ricing).

### Installation (dependencies)
> Warning! The current application launcher is only for rofi prior to version 1.6.0 (1.5.4). [Issue](https://github.com/owl4ce/dotfiles/issues/3#issuecomment-688324366)
  <details open>
  <summary><strong>Debian & Ubuntu (and all based distributions)</strong></summary>
  
  ```bash
  sudo apt install openbox obconf alsa-utils brightnessctl nitrogen dunst tint2 gsimplecal rofi lxappearance qt5ct qt5-style-plugins lxpolkit xautolock rxvt-unicode xclip scrot thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman ffmpegthumbnailer tumbler w3m w3m-img geany nano vim viewnior mpd mpc ncmpcpp mpv pavucontrol parcellite neofetch htop zsh imagemagick ffmpeg
  ```

  </details>
  
  <details>
  <summary>oh-my-zsh & plugins</summary>
  
  - ```bash
    chsh -s /usr/bin/zsh
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
  
  > I haven't tested it yet.
  
  - ```bash
    sudo apt install libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev  libpcre2-dev  libevdev-dev uthash-dev libev-dev libx11-xcb-dev
    ```
  - ```bash
    git clone https://github.com/yshui/picom.git
    ```
  - ```bash
    cd picom/
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
    
  - [Git](https://github.com/trizen/obmenu-generator/blob/master/INSTALL.md)
  
  </details>
  
  <br>
  
  <details open>
  <summary><strong>Arch Linux (and all based distributions)</strong></summary>
  
  > Make sure your **AUR Helper** is *yay*.
  
  ```bash
  yay -S openbox obconf alsa-utils brightnessctl nitrogen dunst tint2 gsimplecal rofi lxappearance qt5ct qt5-styleplugins lxsession xautolock rxvt-unicode-patched xclip scrot thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman ffmpegthumbnailer tumbler w3m geany nano vim viewnior mpd mpc ncmpcpp mpv pavucontrol parcellite neofetch htop picom obmenu-generator gtk2-perl zsh zsh-completions imagemagick ffmpeg
  ```
  
  </details>
  
  <details>
  <summary>oh-my-zsh & plugins</summary>
  
  - ```bash
    chsh -s /usr/bin/zsh
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
  
  **Optional**: [audacious](https://audacious-media-player.org/), [cava](https://github.com/karlstav/cava), [gimp](https://www.gimp.org/), [improved nano syntax highlighting](https://github.com/scopatz/nanorc), [networkmanager-dmenu](https://github.com/firecat53/networkmanager-dmenu), [slim](https://wiki.archlinux.org/index.php/SLiM), [spotify](https://www.spotify.com/id/download/linux/), [termite](https://www.compuphase.com/software_termite.htm), [xfce4-power-manager](https://docs.xfce.org/xfce/xfce4-power-manager/getting-started), [zathura](https://pwmt.org/projects/zathura/).

### Installation (dotfiles)
  <details open>
  <summary><strong>Most of the files</strong></summary>
  
   You can clone or download it as a zip. After that put all files in the **dotfiles** folder to user's home directory or ( **~** ).
   - ```bash
     git clone https://github.com/owl4ce/dotfiles.git
     ```
   - ```bash
     cd dotfiles/ && cp -r * ~/
     ```
   - ```bash
     rm -r ~/{README.md,LICENSE,.git} # Delete unnecessary files
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
     rm ~/.icons/{Papirus-Custom,Papirus-Dark-Custom}.tar.xz # Delete unnecessary archives
     ```
     
   </details>

For refresh font cache do: 
```bash
fc-cache -rv
```
The [Others](./Others/) folder contains slim themes. SLiM themes read [this](./Others/slim).

### Detailed environment
Please refer to [wiki/Detailed-Environment](https://github.com/owl4ce/dotfiles/wiki/Detailed-Environment).

### Some user configuration
- **Google-chrome / Chromium (tip)** \
  Settings: `chrome://settings/`
  - Themes: `Use GTK+`
  - `Use system title bar and borders`
  
  New Tab
  - Extension: [Tabliss - A Beautiful New Tab](https://chrome.google.com/webstore/detail/tabliss-a-beautiful-new-t/hipekcciheckooncpjeljhnekcoolahp?hl=en)
  
  Tabliss -  Widgets Font
  - Greeting, Message: [Youth Touch DEMO](https://www.dafont.com/youth-touch.font)
  - Time, Search Box, Weather: [SFNS Display](./Others/slim/fonts)

- **Screenshots (now, select/draw, timer)** \
  `~/.scripts/shot-now` \
  `~/.scripts/shot-seldraw` \
  `~/.scripts/shot-timer`
  ```cfg
  ...
  
  savedir=~/Pictures
  bordercolor="#ffffff"
  sec="5"

  ...
  ```
  
- **Root Privileges ([SUID](https://en.wikipedia.org/wiki/Setuid))**
  - `poweroff`
  - `reboot`
  - `brightnessctl`
  - *others if needed*
  ```bash
  sudo chmod u+s /bin/{poweroff,reboot,brightnessctl}
  ```
  > For `brightnessctl` I recommend [adding users to the group](https://wiki.archlinux.org/index.php/Users_and_groups#Group_management) `video`.
  
- **Default Lockscreen** \
  `~/.config/openbox/lockscreen`
  
- **Tray** \
  `~/.config/openbox/tray`
  
- **URxvt Icon** \
  `~/.Xresources`
  ```cfg
  ...
  
  URxvt.iconFile:                   /home/yuuto/.icons/gladient/term.png
  
  ...
  ```
  
- **Tint2 Network Status (interface)** \
  `~/.config/tint2/executor/network`
  ```cfg
  ...
  
  intwifi="wlan0"
  intether="eth0"
  
  ...
  ```

- **Neofetch Image (w3m)** \
  `~/.config/neofetch/config.conf`
  ```cfg
  ...
  
  # Image Source
  #
  # Which image or ascii file to display.
  #
  # Default:  'auto'
  # Values:   'auto', 'ascii', 'wallpaper', '/path/to/img', '/path/to/ascii', '/path/to/dir/'
  #           'command output (neofetch --ascii "$(fortune | cowsay -W 30)")'
  # Flag:     --source
  #
  # NOTE: 'auto' will pick the best image source for whatever image backend is used.
  #       In ascii mode, distro ascii art will be used and in an image mode, your
  #       wallpaper will be used.
  image_source="auto"
  #image_source="${HOME}/.config/neofetch/arch.png"
  #image_source="${HOME}/.config/neofetch/artix.png"
  #image_source="${HOME}/.config/neofetch/gentoo.png"
  #image_source="${HOME}/.config/neofetch/ob.png"
  
  ...
  ```
  
- **MPD Music Directory** \
  `~/.mpd/mpd.conf`
  ```cfg
  ...
  
  music_directory     "~/Music/"
  
  ...
  ```
  
- **Ncmpcpp Music Directory** \
  `~/.ncmpcpp/config` \
  `~/.ncmpcpp/albumart` \
  `~/.ncmpcpp/albumart-only` \
  `~/.ncmpcpp/albumart-viz`
  ```cfg
  ...
  
  mpd_music_dir = "~/Music/"
  
  ...
  ```
  
> **How to use ncmpcpp albumart?** \
It's easy, put `album|cover|folder|artwork|front.jp?g|png|gif|bmp` into folder with song album. Recommended image size is *500px* ( **1:1** ) or more.

## :memo:  Notes
### <p align="center">Color Scheme</p>
<p align="center"><a name="top" href="#color-scheme"><img src="https://i.ibb.co/9TDTqsy/color-scheme.png" alt="owl4ce.color-scheme" height="60%" width="100%"></a></p>

### <p align="center">:love_letter:</p>
<p align="center">Please don't underrate, I've configured them all since April 2020 and have been stuDYING them since <a href="https://github.com/owl4ce/dotfiles/wiki/My-Linux-Ricing-Journey">October 2019</a>. Awesome open-source. If you support it, star it or make a PR. Or if there is a problem with configuration you can make an issue here.</p><p align="center"><b>Thank you!</b></p>

## :hearts:  Credits / Thanks
- [Elenapan](https://github.com/elenapan)
- [Adhi Pambudi](https://github.com/addy-dclxvi)
- [Fikri Omar](https://github.com/fikriomar16)
- [Rizqi Nur Assyaufi](https://github.com/bandithijo)
- [Muktazam Hasbi Ashidiqi](https://github.com/reorr)
- [Ghani Rafif](https://github.com/ekickx)
- [Aditya Shakya](https://github.com/adi1090x)
- [Ekaunt](https://github.com/ekaunt) - [Better promptmenu](https://github.com/owl4ce/dotfiles/pull/2)
- [HopeBaron](https://github.com/HopeBaron) - [Termite config](https://github.com/owl4ce/dotfiles/pull/4)
- Our local linux community [Linuxer Desktop Art](https://web.facebook.com/groups/linuxart) and [r/unixporn](https://www.reddit.com/r/unixporn/).
- Some people in the forum who provide solutions.
- All artists who make pictures, illustrations, and wallpapers ( **©** ).
