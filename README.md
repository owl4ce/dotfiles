<p align="center">
  <a name="top" href="#octocat-hi-there-thanks-for-visiting-">
     <img alt="owl4ce/dotfiles" height="60%" width="100%" src="https://i.imgur.com/wQ6ih88.png"/>
  </a>
</p>

<p align="center">
  <a href="#cherry_blossom-setup">
    <img width="120px" style="padding: 0 10px;" src="https://i.imgur.com/aRhWQWq.png"/>
  </a>
  <a href="https://github.com/owl4ce/dotfiles/wiki/Keybinds">
    <img width="120px" style="padding: 0 10px;" src="https://i.imgur.com/H62B9tG.png"/>
  </a>
  <a href="https://deviantart.com/owl4ce/gallery/76024204/joyful-desktop-v3">
    <img width="120px" style="padding: 0 10px;" src="https://i.imgur.com/KKkvKE1.png"/>
  </a>
  <a href="#users-configuration">
    <img width="120px" style="padding: 0 10px;" src="https://i.imgur.com/G993TxA.png"/>
  </a>
</p>

##  
### :octocat: Hi there! Thanks for visiting! <img alt="" align="right" src="https://badges.pufler.dev/visits/owl4ce/dotfiles?style=flat-square&label=&color=fa74b2&logo=GitHub&logoColor=white&labelColor=373e4d"/>

<a href="https://github.com/owl4ce/dotfiles/releases/tag/3.2">
  <img src="https://i.imgur.com/4J0aHbi.png" alt="minimal" align="right" width="400px"/>
</a>

This is my **personal configuration** for my favorite openbox window manager and some apps too.

I hope you understand everything here. :wink:

Here are some details about my setup ..
- **Window Manager**               • [Openbox](http://openbox.org/wiki/Main_Page) :art: 4 changable mode!
- **Shell**                        • [Zsh](https://www.zsh.org/) :shell: with [oh my zsh](https://github.com/ohmyzsh/ohmyzsh) framework! <kbd>optional</kbd>
- **Terminal**                     • [URxvt](http://software.schmorp.de/pkg/rxvt-unicode.html), [Termite](https://github.com/thestinger/termite) <kbd>available</kbd>
- **Openbox Menu**                 • [OBmenu-generator](https://github.com/trizen/obmenu-generator)
- **Panel**                        • [Tint2](https://gitlab.com/o9000/tint2) :shaved_ice: material icon font!
- **Compositor**                   • [Picom](https://github.com/yshui/picom) :doughnut: rounded corners!
- **Notify Daemon**                • [Dunst](https://github.com/dunst-project/dunst) :leaves: minimalism!
- **Application Launcher**         • [Rofi](https://github.com/davatorium/rofi) :rocket: blazing fast!
- **File Manager**                 • [Thunar](https://github.com/xfce-mirror/thunar) :bookmark: customized sidebar & icon!
- **Music Player**                 • [Mpd](https://www.musicpd.org/) + [Ncmpcpp](https://github.com/ncmpcpp/ncmpcpp), [Spotify](https://www.spotify.com/us/download/linux/) :rice_scene: *riced!*
- **GUI & CLI IDE/Text-Editor**    • [Geany](https://www.geany.org/), [Neovim](https://neovim.io/)

## :gift: Changelogs <img alt="" align="right" src="https://img.shields.io/github/repo-size/owl4ce/dotfiles?style=flat-square&label=.files&color=cf8ef4&labelColor=373e4d"/>

<a href="https://www.deviantart.com/owl4ce/art/Sakura-Saber-872360153">
  <img src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/072e191f-a0a5-4be2-bc7a-55eb140b254f/defdpeh-4b226af5-f035-4a5d-aedc-b9417b92563c.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvMDcyZTE5MWYtYTBhNS00YmUyLWJjN2EtNTVlYjE0MGIyNTRmXC9kZWZkcGVoLTRiMjI2YWY1LWYwMzUtNGE1ZC1hZWRjLWI5NDE3YjkyNTYzYy5wbmcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.NHrNlWDMbuIVmHkpw4w6l0g7dMJGecLjxXsEPz1tHkI" alt="normal" align="right" width="400px"/>
</a>

<details>
  <summary><strong>v3.0</strong></summary>
  
  - **Visual Mode:**
    - Both modes (minimal) have their own window button styles, margins, sidebar rofi, and dunst layouts.
    - Removed eyecandy tint2 from Joyful Desktop v2
    - Better Tint2 (added temp executor, etc)
    - Added rotation mode (crossover, except minimal mode)

  - **Major Changes:**
    - Removed SLiM sync background, custom slim themes, and unnecessary files/config.
    - All scripts are reproduced all with central variables in one [file](./.owl4ce_var). 
    - Reverse terminal background and foreground (urxvt/termite)
    - Nvim Config - Thanks to [@elenapan](https://github.com/elenapan/dotfiles)
    - SLiM Themes (optional) - See [here](#users-configuration)
    - URxvt Font Resizer - See [keybinds](https://github.com/owl4ce/dotfiles/wiki/Keybinds#urxvt)
    - Included [Networkmanager_dmenu](./.local/bin/networkmanager_dmenu)
    - Oh My ZSH Theme - [Rounded](./.oh-my-zsh/custom/themes/rounded.zsh-theme)
    - Rofi v1.6.0 Supported
    - New Ncmpcpp UI
    - Neofetch Images
    - New Wallpapers
    
</details>

<details>
  <summary><strong>v3.1</strong></summary>
  
  - **Screenshot Script:** Rounded corners, quality, shadows.
  - Terminal UI improvements, particularly font size
  - Bug fixes and improvements
  - Rounded picom as default
  - New Wallpapers
  
</details>

<details>
  <summary><strong>v3.2</strong> <kbd>latest</kbd></summary>
  
  **Major Update:**
  - Customizable partial color accent and start button glyphs - [`L4-L63`](./.owl4ce_var#L4-L63)
  - New ncmpcpp albumart image backend (w3mimgdisplay) - [`L137-L147`](./.owl4ce_var#L137-L147)
  - Centralize dunst and urxvt opacity level and web browser - [`L64-L76`](./.owl4ce_var#L64-L76)
  - Both modes have their own window button last location
  - **Sakura Saber**『桜(さくら)セイバー』 Themed
  - Reconfigure openbox window titlebar colors
  - One click wallpaper generator (colorizer)
  - Auto configure urxvt app icons
  - Notify-send improvements
  - Added **Restart UI**
  - Optimize scripts
  
  For the rest, see the [commits](https://github.com/owl4ce/dotfiles/commits/main). Also check my [workflow](https://youtu.be/kSoViKHt-Yo).
  
</details>
  
## :cherry_blossom: Setup
This is step-by-step how to install these **.files** for automatic setup OpenboxWM custom environment. [Mirror @ GitLab](https://gitlab.com/owl4ce/dotfiles.git).

##  

### Introduction of Linux Rice

<details>
<summary>Please read <a target="_blank" href="https://crispgm.com/page/the-fascinating-arch-linux-rice.html">this</a> nor <a target="_blank" href="https://jie-fang.github.io/blog/basics-of-ricing">this</a>.</summary>
  
<br>

<p align="center"><a href="#introduction-of-linux-rice"><img src="https://i.redd.it/yu0auhxk5nyz.png" alt="unixporn"/></a></p>

</details>

##  

### Installation (dependencies)
> Customize your choice about dependencies below, this is my complete setup as I use single OS, single OpenboxWM with my preference utility softwares. In fact, whats in the column is a minimal recommendation.

> **Detailed environment**  
> Please refer to [wiki/Detailed-Environment](https://github.com/owl4ce/dotfiles/wiki/Detailed-Environment).

> **Warning!**  
> This configuration is highly dependent to **bash**, **findutils**, **sed**, and **coreutils**.  
> Assume that you are using [**sudo**](https://www.sudo.ws/) or [**doas**](https://github.com/Duncaen/OpenDoas). Installation feels like [LFS](http://www.linuxfromscratch.org/)? :satisfied:

> **Attention!**  
> - Rofi must be above version `1.6.x`, so for Debian-based you may need to compile manually from source. - [issue](https://github.com/owl4ce/dotfiles/issues/37)  
> - If your Linux distribution repository only contains pure `rxvt-unicode` without patch for wide unicode and others, an example is on Arch Linux which provides pure `rxvt-unicode` and `rxvt-unicode-patched` version in the AUR repository. The problem is that the urxvt in the AUR hasn't been updated yet, and the link for the urxvt source-code for that version has been removed from the original link. Therefore, use `rxvt-unicode` from the main repo of each linux distribution that you use. Debian is different (already patched). - [issue](https://github.com/owl4ce/dotfiles/issues/105)
> - You may want to use `polkit-gnome` instead of `lxsession` nor `lxpolkit`. Because, currently the `lxsession` in Gentoo/Linux is really bad (circular dependencies).
> - I guess the latest [`yshui/picom`](https://github.com/yshui/picom/issues) might be problematic on certain devices. On me, experiencing some border flickering on the Openbox desktop menu (right click). So I reverted it on commit with id sha [`9cb552ecd91ec644bf6fcb558ddd44fda5b4f7d9`](https://github.com/yshui/picom/commit/9cb552ecd91ec644bf6fcb558ddd44fda5b4f7d9) with [git checkout](https://devopscube.com/checkout-clone-specific-git-commit-id-sha).

  <details open>
  <summary><strong>Debian & Ubuntu (and all based distributions)</strong></summary>
  
   ```sh
   sudo apt install rsync python psmisc x11-utils imagemagick ffmpeg wireless-tools openbox pulseaudio \
   alsa-utils brightnessctl nitrogen dunst tint2 gsimplecal rofi qt5-style-plugins lxpolkit xautolock  \
   rxvt-unicode xclip scrot thunar thunar-archive-plugin thunar-volman ffmpegthumbnailer tumbler       \
   viewnior mpv mpd mpc ncmpcpp pavucontrol parcellite neofetch w3m w3m-img htop playerctl xsettingsd
   ```

  </details>
  
  <details>
  <summary>oh-my-zsh & plugins <kbd>optional</kbd></summary>
  
   ```sh
   sudo apt install zsh && chsh -s $(command -v zsh)
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
   git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
   git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
   ```
    
  </details>
  
  <details>
  <summary>picom</summary>
    
   ```sh
   sudo apt install meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev \
   libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev   \
   libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev    \
   libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev
   ```
   ```sh
   git clone https://github.com/yshui/picom.git         && \
   cd picom/ && git submodule update --init --recursive && \
   meson --buildtype=release . build                    && \
   ninja -C build                                       && \
   ninja -C build install
   ```

  </details>

  <details>
  <summary>obmenu-generator</summary>
  
   > I haven't tested it yet.
  
   ```sh
   sudo su
   ```
   ```sh
   echo 'deb http://download.opensuse.org/repositories/home:/Head_on_a_Stick:/obmenu-generator/Debian_10/ /' > /etc/apt/sources.list.d/home:Head_on_a_Stick:obmenu-generator.list
   wget -nv https://download.opensuse.org/repositories/home:Head_on_a_Stick:obmenu-generator/Debian_10/Release.key -O Release.key
   apt-key add - < Release.key && apt update && apt install obmenu-generator libgtk2-perl
   ```
    
   [See installation from git](https://github.com/trizen/obmenu-generator/blob/master/INSTALL.md).
  
  </details>
  
  <br>
  
  <details open>
  <summary><strong>Arch Linux (and all based distributions)</strong></summary>
  
   > Make sure your **AUR Helper** is [`paru`](https://github.com/Morganamilo/paru) or [`yay`](https://github.com/Jguer/yay).
  
   ```sh
   paru -S rsync python psmisc xorg-xprop xorg-xwininfo imagemagick ffmpeg wireless_tools openbox \
   pulseaudio pulseaudio-alsa alsa-utils brightnessctl nitrogen dunst tint2 gsimplecal rofi       \
   qt5-styleplugins lxsession xautolock rxvt-unicode-truecolor-wide-glyphs xclip scrot thunar     \
   thunar-archive-plugin thunar-volman ffmpegthumbnailer tumbler viewnior mpv mpd mpc ncmpcpp     \
   pavucontrol parcellite neofetch w3m htop picom-git obmenu-generator gtk2-perl playerctl xsettingsd
   ```

  </details>
  
  <details>
  <summary>oh-my-zsh & plugins <kbd>optional</kbd></summary>
  
   ```sh
   sudo pacman -S zsh && chsh -s $(command -v zsh)
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
   git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
   git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
   ```
  
  </details>

  <br>
  
  <details>
  <summary><strong>Another Linux Distribution</strong></summary>
  
   Customize/port dependencies yourself!  
   
   **For example**  
   - [Gentoo/Linux](https://packages.gentoo.org/)  
     *[See owl4ce's portage configuration](https://github.com/owl4ce/hmg/tree/main/etc/portage).*
     
   - [Void (Linux)](https://voidlinux.org/packages/)
   
   > Maybe you can reference the package name with Arch Linux.  
   > For Gentoo/Linux, I recommend to enabling [keywords](https://wiki.gentoo.org/wiki/ACCEPT_KEYWORDS) for specific packages or using [live ebuild](https://wiki.gentoo.org/wiki/Ebuild).
  
   If it's not there, compile it manually from git source code or from elsewhere.
  
  </details>
  
  <br>
    
  **Optional**: [betterdiscord](https://betterdiscord.net/), [geany](https://geany.org/) + [geany plugins](https://plugins.geany.org/), [gimp](https://www.gimp.org/), [nano](https://www.nano-editor.org/) + [nano syntax highlighting](https://github.com/scopatz/nanorc), [neovim](https://neovim.io/), [spotify](https://www.spotify.com/us/download/linux/), [termite](https://www.compuphase.com/software_termite.htm), [xfce4-power-manager](https://docs.xfce.org/xfce/xfce4-power-manager/getting-started).
  
##  

### Installation (dotfiles) 
  
  > **Are all directories required?** :thinking:  
  > Please refer to [wiki/Detailed-Environment](https://github.com/owl4ce/dotfiles/wiki/Detailed-Environment).
  
  <details open>
  <summary><strong>Most of .files</strong></summary>
  
   You can clone or download as a [archive](https://github.com/owl4ce/dotfiles/releases). After that put all files in the **dotfiles** folder into user's home directory.
   > Assume you are cloning in the `~/Documents` directory for example. I recommend to install with **rsync**. So why?
   ```sh
   cd ~/Documents/ && git clone https://github.com/owl4ce/dotfiles.git
   ```
   ```sh
   rsync -avxHAXP --exclude '.git*' --exclude 'LICENSE' --exclude '*.md' dotfiles/ ~/
   ```
   > **Explanation**
   > | Options     | Function                                            |
   > |:-----------:|-----------------------------------------------------|
   > | `-a`        | all files, with permissions, etc..                  |
   > | `-v`        | verbose, mention files                              |
   > | `-x`        | stay on one file system                             |
   > | `-H`        | preserve hard links (not included with -a)          |
   > | `-A`        | preserve ACLs/permissions (not included with -a)    |
   > | `-X`        | preserve extended attributes (not included with -a) |
   > | `-P`        | show progress                                       |
   > | `--exclude` | exclude files matching PATTERN                      |
   >
   > **Differences**  
   > - `cp` is for duplicating stuff and by default only ensures files have unique full path names.
   > - `rsync` is for synchronising stuff and uses the size and timestamp of files to decide if they should be replaced. It has many more options and capabilities than **cp**.
   >
   >   
   > I recommend to not deleting **dotfiles** dir after cloning from this repository, to make upgrades easier (if you care). Read the [update](#update) section.
  
  </details>

  <details open>
  <summary><strong>Icons</strong></summary>
    
   > `pushd` is same as `cd`, but can return back to the previous directory by using `popd` (checkpoint).
   ```sh
   pushd ~/.icons/ && \
       tar -Jxvf Papirus-Custom.tar.xz && tar -Jxvf Papirus-Dark-Custom.tar.xz       && \
       sudo ln -vs ~/.icons/Papirus-Custom /usr/share/icons/Papirus-Custom           && \
       sudo ln -vs ~/.icons/Papirus-Dark-Custom /usr/share/icons/Papirus-Dark-Custom && \
   popd
   ```
   > **Why I need to link icons to [/usr](https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/usr.html)?** :thinking:  
   > That's needed by dunst in order to display most of icon from notification that spawned by programs.
     
  </details>

  <details open>
  <summary><strong>Refresh Font Cache</strong></summary>
  
   ```sh
   fc-cache -rv
   ```
    
  </details>

  <details open>
  <summary><strong>Root Privileges with <a href="https://en.wikipedia.org/wiki/Setuid#SUID">SUID</a></strong></summary>
   
   - `brightnessctl`
   - *others if needed.*
   
   > For **brightnessctl**, I would recommend [adding users to video group](https://wiki.archlinux.org/index.php/Users_and_groups#Group_management).
   
   ```sh
   sudo chmod u+s $(command -v brightnessctl)
   ```
    
  </details>
  
### The step you are waiting for
The final step is login into **openbox-session**, basically login from display manager you use such as lightdm, gdm, etc.

> **Note**  
> Make sure the `sh` symlinks to `bash`, as it's very dependent on **bash**.
> ```sh
> [ "$(readlink /bin/sh)" != "bash" ] && sudo ln -vfs bash /bin/sh
> ```

If you are using `~/.xinitrc` without display manager, simply add the following commands.

**Systemd Linux Distribution**  
```sh
exec openbox-session
```

**[Init-Freedom](https://www.devuan.org/os/init-freedom) Linux Distribution**  
```sh
exec dbus-launch --exit-with-session openbox-session
```

Then you can proceed to [user's configuration](#users-configuration). Explore!

##  

### Additional

**Suggested replacement commands**
- `ls` ➜ [`exa`](https://github.com/ogham/exa)  

[`~/.zshrc`](./.zshrc)  
```zsh
...

134 alias ls="exa -lgh --icons --group-directories-first"
135 alias la="exa -lgha --icons --group-directories-first"

...
```

- `cat` ➜ [`bat`](https://github.com/sharkdp/bat)

- [See more](https://github.com/ibraheemdev/modern-unix).

<br>

**Suggestion for tiling users**
<p align="center">
  <a href="https://github.com/blrsn/zentile">
    <img src="https://raw.githubusercontent.com/blrsn/zentile/master/docs/zentile-logo.png" alt=""/>
  </a>
</p>

I recommend to compile it from source. Then put the **zentile** binary into your **PATH**, for example in `~/.local/bin/`
```sh
# To run in the background (detached)
zentile &! 

# To kill (or pkill)
killall zentile
```

##  

### Update

Since I recommend using **rsync** from start, the easiest way is to list the files that will not be updated to avoid replacing personal files with files in the **dotfiles**. First, update the local repository with remote git repository.
> Remember where you cloned this repository.  
> For example, from the start we assumed that it was in `~/Documents`.
```sh
cd ~/Documents/ &&
pushd dotfiles/ && git pull && popd
```
Then create a file with **PATTERN** list containing files/dirs that **rsync** will exclude. For example,  
`~/.dotexc`
```cfg
.git*
LICENSE
*.md
*.joy
BetterDiscord
geany
GIMP
gtk-3.0
config.conf
nvim
autostart
environment
tray
shared
sidebar
termite
Thunar
xfconf
zathura
.fonts
.nothing
.mpd
.gtkrc-2.0
.zshrc
.nanorc
.Xresources
.xsettingsd
```
> Use `find` command to check the **PATTERN**,
> ```sh
> find dotfiles/ -iname 'PATTERN'
> ```
.. and whatever the file is. Sync now ..
```sh
rsync -avxHAXP --exclude-from ~/.dotexc dotfiles/ ~/
```

##  

### User's configuration
- **SLiM Themes <kbd>deprecated, optional</kbd>**
  <details>
  <summary><strong>See</strong></summary>
  
    <p align="center">In fact, I use SLiM just for lockscreen <b>@ 2020</b>. Currently, I don't use lockscreen.</p>
    
    <p align="center"><a href="https://www.deviantart.com/owl4ce/art/Floflo-Batik-SLiM-Themes-861519439">
      <img src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/072e191f-a0a5-4be2-bc7a-55eb140b254f/de8xcnj-d1413505-68ee-49bd-ba72-00cd3f2a2d9e.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvMDcyZTE5MWYtYTBhNS00YmUyLWJjN2EtNTVlYjE0MGIyNTRmXC9kZTh4Y25qLWQxNDEzNTA1LTY4ZWUtNDliZC1iYTcyLTAwY2QzZjJhMmQ5ZS5wbmcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.KPhW15Vepsxlr7San7OuBA_oyVfs-k7Bh1hCrbqC528" alt="floflo-batik" align="center"/>
    </a></p>
    
    <p align="center">Just click on the image above!</p>
    
  </details>

- **Chromium-based Web Browser <kbd>suggested</kbd>**
  <details>
  <summary><strong>See</strong></summary>
  
    **Settings:** [`chrome://settings/`](chrome://settings/)
    - **Themes:** `Use GTK+`
    - `Use system title bar and borders`
    
    <br>
    
    <p align="center"><a href="https://brave.com/"><img src="https://i.imgur.com/JYVvCLp.png" alt="brave.thumbnail"/></a></p>
    
    <p align="center">You may want to turn on <a href="https://www.linuxuprising.com/2021/01/how-to-enable-hardware-accelerated.html">Hardware Acceleration.</a></p>
    
  </details>
  
- **Spotify - Spicetify Theme <kbd>suggested</kbd>**
  <details>
  <summary><strong>See</strong></summary>
  
    <br>
    
    <p align="center"><a href="https://github.com/owl4ce/spicetify-themes/tree/new/Dribbblish#eyecandy">
    <img src="https://raw.githubusercontent.com/owl4ce/spicetify-themes/new/Dribbblish/eyecandy.png" alt="spicetify.dribbblish-eyecandy"/>
    </a></p>
    <p align="center"><a href="https://github.com/owl4ce/spicetify-themes/tree/new/Dribbblish#mechanical">
    <img src="https://raw.githubusercontent.com/owl4ce/spicetify-themes/new/Dribbblish/mechanical.png" alt="spicetify.dribbblish-mechanical"/>
    </a></p>
    
    <p align="center">Just click on the image above!</p>
    <p align="center">Or maybe you want a <a href="https://downgit.github.io/#/home?url=https://github.com/owl4ce/spicetify-themes/tree/new/Dribbblish">direct link</a> without downloading the complete repository.</p>
    <p align="center">??? <a href="https://github.com/tsmetana/spotify-tray">spotify-tray</a> ???</p>
    
  </details>
  
- **Telegram Desktop <kbd>suggested</kbd>**
  <details>
  <summary><strong>See</strong></summary>
  
    <br>
    
    <p align="center"><a href="https://github.com/gilbertw1/telegram-nord-theme">
    <img src="https://i.imgur.com/5jEGp1j.png" alt="tdesktop.nord"/>
    </a></p>
    
    <p align="center">Just click on the image above!</p>
    
  </details>
    
- **Capitaine Cursors Theme <kbd>suggested</kbd>**
  <details>
  <summary><strong>See</strong></summary>
  
    <br>
    
    <p align="center"><a href="https://www.pling.com/p/1148692">
    <img src="https://cdn.pling.com/img/6/8/5/6/0e64785edeb13cf2527cb2fd0f29774af6c4.png" alt="capitaine-cursors"/>
    </a></p>
    <p align="center"><a href="https://www.pling.com/p/1148692">
    <img src="https://cdn.pling.com/img/4/8/3/5/e6df21a4d723a4e21a1b85f9ae5979f6fb25.png" alt="capitaine-cursors"/>
    </a></p>
    
    <p align="center">Just click on the image above!</p>
    
  </details>
  
- **Touchpad tap-to-click (libinput) <kbd>optional</kbd>**  
  `/etc/X11/xorg.conf.d/30-touchpad.conf`
  ```cfg
  Section "InputClass"
      Identifier "touchpad"
      Driver "libinput"
      MatchIsTouchpad "on"
      Option "Tapping" "on"
      Option "TappingButtonMap" "lmr"
  EndSection
  ```
  [More information](https://wiki.archlinux.org/index.php/Libinput).
  
- **User's Preferences <kbd>required</kbd>**  
  [`~/.owl4ce_var`](./.owl4ce_var)  
  Manage all your settings there. I hope all comments there are easy to understand. ^^
  
- **User's Tray Icons**  
  [`~/.config/openbox/tray`](./.config/openbox/tray)  
  An example is turning on `nm-applet`, because by default I don't use it and use [`networkmanager_dmenu`](./.local/bin/networkmanager_dmenu) instead.

  > **How about battery indicator?**  
  > Because on the `tint2` panel I turned off battery status. Alternatively, install `xfce4-power-manager` and enable system tray icon in **xfce4-power-manager-settings**.

  Remove hashtags for all your needs, then relogin the openbox-session.
  > **Warning!** Putting commands here means that when switching Visual Mode, the program will be restarted.
  ```cfg
  1 #
  2 # This tray will restart after switching modes
  3 # Please add "&" after command
  4 #
  5 # ---
  6
  7 parcellite &
  8 #nm-applet &
  9 #xfce4-power-manager &
  ```
  
- **Available Default Apps**  
  [` ~/.scripts/default-apps/list.joy`](./.scripts/default-apps/list.joy)
  - **Terminal**: `urxvt` `termite`
  - **Lockscreen**: *anything*
  - **Music Player**: `mpd` `spotify`
  - **File Manager**: *anything*
  
  ```cfg
  1 terminal="urxvt"
  2 lockscreen="slimlock"
  3 musicpl="mpd"
  4 filemanager="thunar"
  ```
  
- **Neovim**  
  [`~/.config/nvim/`](./.config/nvim/)  
  You know what to do with [Vim-plug](https://github.com/junegunn/vim-plug).
  
- **MPD Music Directory**  
  [`~/.mpd/mpd.conf`](./.mpd/mpd.conf)
  ```cfg
  ...
  
  6 music_directory     "~/Music"
  
  ...
  ```
  
- **Ncmpcpp Music Directory**  
  Auto-connect with MPD.
  
  > **How to use ncmpcpp albumart?** (URxvt)  
  It's easy, just put `album|cover|folder|artwork|front.jp?g|png|gif|bmp` into folder with song album. Recommended image size is *500px* ( **1:1** ) or more. [See keybinds](https://github.com/owl4ce/dotfiles/wiki/Keybinds#ncmpcpp).

- **Audio Server <kbd>optional</kbd>**  
  [`~/.config/openbox/autostart`](./.config/openbox/autostart)  
  <details>
  <summary>This is optional for Linux distributions that don't use systemd as their init, actually pulseaudio can be triggered from increasing-decreasing audio volume.</summary>
  
  - **Pulseaudio**
    ```cfg
    ...

    9  # there was once a pulseaudio here
    10 pulseaudio --start --log-target=syslog &> /dev/null &

    ...
    ```
    
    Or if you use [pipewire](https://github.com/PipeWire/pipewire) as pulseaudio.
  - **Pipewire as Pulseaudio**
    > More details at [ArchWiki](https://wiki.archlinux.org/index.php/PipeWire#PulseAudio_clients) / [Gentoo Wiki](https://wiki.gentoo.org/wiki/Pipewire#Replacing_PulseAudio).  
    >  Make sure `pulseaudio` is uninstalled or disable **autospawn**.  
    > `/etc/pulse/client.conf`
    > ```cfg
    > ...
    >
    > 25  autospawn = no
    >
    > ...
    > ```
    
    ```sh
    ...

    9  # there was once a pulseaudio here
    10 pipewire &> /dev/null &
    
    ...
    ```
    
  </details>
  
- **QT Themer (env var) <kbd>optional</kbd>**  
  [`~/.config/openbox/environment`](./.config/openbox/environment)  
  This is optional if you are having issues like blind text with background from Mechanical Theme (Fleon GTK), as it basically uses plugins (QT5 to GTK2). Remove `gtk2` after the equal sign, then relogin **openbox-session**.
  ```cfg
  ...
  
  7 # Use qt5-styleplugins for QT Themes
  8 export QT_QPA_PLATFORMTHEME=gtk2
  
  ...
  ```
  
- **Neofetch Image**  
  [`~/.config/neofetch/config.conf`](./.config/neofetch/config.conf)
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
  660 #image_source="${HOME}/.config/neofetch/images/lofi.png"
  661 image_source="${HOME}/.config/neofetch/images/sakura.png"
  662 #image_source="${HOME}/.config/neofetch/images/ubuntu.png"
  663 #image_source="${HOME}/.config/neofetch/images/ubuntu_dark.png"
  664 #image_source="${HOME}/.config/neofetch/images/void.png"
  665 #image_source="${HOME}/.config/neofetch/images/void_dark.png"
  
  ...
  ```
  <details>
  <summary><strong>See Images</strong></summary>
  
  Arch|Gentoo|Ubuntu|Void
  |----|----|----|----|
  ![Arch](./.config/neofetch/images/arch.png)|![Gentoo](./.config/neofetch/images/gentoo.png)|![Ubuntu](./.config/neofetch/images/ubuntu.png)|![Void](./.config/neofetch/images/void.png)

  Arch Dark|Gentoo Dark|Ubuntu Dark|Void Dark
  |----|----|----|----|
  ![Arch](./.config/neofetch/images/arch_dark.png)|![Gentoo](./.config/neofetch/images/gentoo_dark.png)|![Ubuntu](./.config/neofetch/images/ubuntu_dark.png)|![Void](./.config/neofetch/images/void_dark.png)

  Artix|LoFi|Bedrock
  |---|---|---|
  ![Artix](./.config/neofetch/images/artix.png)|![LoFi](./.config/neofetch/images/lofi.png)|![Bedrock](./.config/neofetch/images/bedrock.png)
  
  <table border="0"
  <tr>
  <td>
    <b>Sakura</b>
  </tr>
  </td>
  <tr>
  <td>
  <br>
    <p align="center"><img src="./.config/neofetch/images/sakura.png" alt="Sakura"/></p>
  </td>
  </tr>
  </table>
  
  </details>

## :memo:  Notes
### <p align="center">Color Scheme</p>
<p align="center"><a href="#color-scheme"><img src="https://i.imgur.com/QEUTWUe.png" alt="owl4ce.color-scheme" height="60%" width="100%"></a></p>

<p align="center"><a href="https://www.nordtheme.com">Nord Color Palette<a> Compatible</p>

<table border="0">
<tr>
<td>
<br>
<p align="center">:speech_balloon:</p>
</td>
</tr>
<tr>
<td>
<br>
<p align="center"><b>Widget?</b> We don't do that here. My main philosophy in building this is as a minimal replacement for Desktop Environment without any desktop decoration e.g icons and widgets, but it can be adapted to taste of user with an overall theme based on one color palette and can be easily switched between Mechanical-Eyecandy. I admit, the downside is that it relies heavily on the GNU/Linux operating system since bashism is not POSIX-compliant to other shell. Most of the size of this repository is large due to wallpapers, icons, and git caches.</p><p align="center">Please don't underrate, I've configured them all since April 2020 and have been stuDYING them since <a href="https://github.com/owl4ce/dotfiles/wiki/My-Linux-Ricing-Journey">October 2019</a>. Awesome open-source. If you support it, <b>star</b> it or make a <a href="https://github.com/owl4ce/dotfiles/pulls">PR</a>. Or if there is a problem with configuration (please check previous issues if any) you can make an <a href="https://github.com/owl4ce/dotfiles/issues">issue</a> here. Also if you want a <a href="https://github.com/owl4ce/dotfiles/discussions">discussion</a>.</p><p align="center"><b>Thank you!</b></p><p align="center"> Feel free to modify.. under <a href="./LICENSE">GPL-3.0</a> (except for GTK+ themes, gladient icons, fonts, and wallpapers)</p><p align="center"><b>Why openbox?</b> Really a perfect next-gen window manager, easily configurable, and less resources usage.</p><p align="center">Openbox isn't dead, but completed features.</p>
</td>
</tr>
<tr>
<td>
<br>
<a href="https://starchart.cc/owl4ce/dotfiles"><p align="center"><img src="https://starchart.cc/owl4ce/dotfiles.svg"/></p></a>
</td>
</tr>
</table>

<br>

## :gift_heart:  Tip Jar
If you enjoy my **dotfiles** and would like to show your appreciation, you may want to tip me here.
It's never required but always wholeheartedly appreciated.

Thank you from the bottom of my heart! :heartpulse:

* **BTC**: `3DrjWyd6Xgv4tKoL56mPtoQX4fL4LbR7zf`
* **ETH**: `0x818fC9B82548C1020ed7370DFeb04BCbADc59191`

<br>

## :confetti_ball:  Acknowledgements
- **Inspiration and main resources**
  - [Elena](https://github.com/elenapan)
  - [Adhi Pambudi](https://github.com/addy-dclxvi)
  - [Fikri Omar](https://github.com/fikriomar16)
  - [Nanda Oktavera](https://github.com/okitavera)
  - [Rizqi Nur Assyaufi](https://github.com/bandithijo)
  - [Muktazam Hasbi Ashidiqi](https://github.com/reorr)
  - [Galih Wisnuaji](https://github.com/nekonako)
  - [Ghani Rafif](https://github.com/ekickx)
  - [Aditya Shakya](https://github.com/adi1090x)
  - ?

- **Extended resources or the manual**
  - [Digital Synopsis](https://digitalsynopsis.com/)
  - [Wiki @ Openbox](http://openbox.org/wiki/Help:Themes)
  - [Pango Markup @ Gnome](https://developer.gnome.org/pango/stable/pango-Markup.html)
  - [Custom Environment @ ArchWiki](https://wiki.archlinux.org/index.php/desktop_environment#Custom_environments)
  - [Recommended Applications @ Gentoo Wiki](https://wiki.gentoo.org/wiki/Recommended_applications)
  - [Pure Bash Bible](https://github.com/dylanaraps/pure-bash-bible)
  - [Stark's Color Scripts](https://github.com/stark/Color-Scripts)
  - [Notify Send (bash)](https://github.com/vlevit/notify-send.sh)
  - [NetworkManager Dmenu](https://github.com/firecat53/networkmanager-dmenu)
  - [URxvt Manual](https://linux.die.net/man/1/urxvt)
  - [URxvt Resize Font](https://github.com/simmel/urxvt-resize-font)
  - [URxvt Tabbed Extended](https://github.com/mina86/urxvt-tabbedex)
  - [Showing Album Cover in Ncmpcpp](https://marcocheung.wordpress.com/2015/08/09/showing-album-cover-in-ncmpcpp/)
  - [Complete List of GitHub Markdown Emoji Markup](https://gist.github.com/rxaviers/7360908)
  - Most people on some GNU/Linux and UN*X forums.
  
- **Contributors**
  - [Ekaunt](https://github.com/ekaunt) - [Better promptmenu](https://github.com/owl4ce/dotfiles/pull/2)
  - [HopeBaron](https://github.com/HopeBaron) - [Termite config](https://github.com/owl4ce/dotfiles/pull/4)
  - [Justin Faber](https://github.com/vredesbyyrd) - [Rofi matched lines indicator](https://github.com/owl4ce/dotfiles/issues/33#issuecomment-753399179)
  
    <br>
    <a href="https://github.com/owl4ce/dotfiles/graphs/contributors">
      <img src="https://contrib.rocks/image?repo=owl4ce/dotfiles" />
    </a>

    Made with [contributors-img](https://contrib.rocks).
  
- **Softwares**
  - [Geany - The Flyweight IDE](https://www.geany.org/)
  - [GIMP - GNU Image Manipulation Program](https://www.gimp.org/)
  - [Gpick - Advanced Color Picker](http://www.gpick.org/)
  - [Gucharmap - GNOME Character Map](https://wiki.gnome.org/Apps/Gucharmap)
  - [Themix - GUI Theme Designer](https://github.com/themix-project/oomox)
  - Tint2conf, etc.

- **Our local linux community [Linuxer Desktop Art](https://facebook.com/groups/linuxart) and [@dotfiles_id](https://t.me/dotfiles_id), also the great [r/unixporn](https://www.reddit.com/r/unixporn/).**
- **© All artist who make icons, illustrations, and wallpapers.**
  
  The original source that I found:
  - [Gladient Icons](https://play.google.com/store/apps/details?id=com.maxghani.gladient)
  - [桜](https://www.pixiv.net/en/artworks/80518034)
  - [桜セイバー沖田総司](https://www.pixiv.net/en/artworks/59740059)
  - [沖田総司](https://www.pixiv.net/en/artworks/62996457)
