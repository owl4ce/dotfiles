<div align="center">

```ocaml
NEVER SKIP / IGNORE / AVOID README
```

```css
      __/)   ‌‌‌‌‬‬‬‍ ‌‌‌‌‌‬‌‌   ‌‌‌‌‌﻿‌‬ ‌‌‌‌‌﻿‌‌‌‌‌‌‌﻿‌‬        ‌‌‌‌‌﻿‌‬_      ‌‌‌‌‌‬‌‌_       ‌‌‌‌‍‬﻿﻿  ‌‌‌‌‍﻿‍﻿ 
   .‌‌‌‌‍‬﻿‌-(_‌‌‌‌‌﻿‍‌_(=:   |   ‌‌‌‌‍‬‌﻿   ‌‌‌‌‍‬‍‍   ‌‌‌‌‌‬‌‌ | | o  | |     ‌‌‌‌‌﻿﻿‌    
‌‌‌‌‍‬‌‍|\ |    \) ‌‌‌‌‍‬﻿‌ _‌‌‌‌‍﻿‍‌_| ‌‌‌‌‍‬‍‍  __ ‌‌‌‌‍﻿‌‬_|‌‌‌‌‍‬﻿‬_ | |‌‌‌‌‍‬‌‍    |‌‌‌‌‍﻿‍‌ |  _ ‌‌‌‌‍‬‍‍  , ‌‌‌‌‌‬﻿‍ 
‌‌‌‌‍﻿‌﻿\‌‌‌‌‍‬‍‍ ||       / ‌‌‌‌‌﻿‍﻿ ‌‌‌‌‍‬‍‍|  /  \_|  |/‌‌‌‌‍‬﻿‬  |  |/  |/  / \‌‌‌‌‍‌‌‌‌‌‌‌‍﻿‌‌_
 \||     ‌‌‌‌‍‬﻿‍  \_/|_/\__/ |_‌‌‌‌‌‬﻿‬/‌‌‌‌‍‬﻿‍|__/|_‌‌‌‌‍‬‍‍/|__/‌‌‌‌‌﻿﻿‬|__/ \/ 
  \|                     |\                 
   |  6F 77 6C 34 63 65  |/  with aesthetics
```

</div>

<pre align="center">
<a href="#seedling--setup">SETUP</a> • <a href="https://github.com/owl4ce/dotfiles/wiki/Keybinds">KEYBINDS</a> • <a href="">GALLERY</a> • <a href="#herb--guides">GUIDES</a>
</pre>

<h1>
  <a href="#--------">
    <img alt="" align="right" src="https://badges.pufler.dev/visits/owl4ce/dotfiles?style=flat-square&label=&color=000000&logo=github&logoColor=white&labelColor=000000"/>
  </a>
</h1>

### :octocat: ‎ <sup><sub><samp>HI THERE! THANKS FOR DROPPING BY!</samp></sub></sup>

<a href="#octocat--hi-there-thanks-for-dropping-by">
  <img alt="" align="right" width="400px" src="https://i.imgur.com/JhcL3k6.png"/>
</a>

You might be here looking for Linux Rice references or to (full?) replicate my personal configurations of my favorite Openbox Window Manager and some apps as well. :snowman:

Averages are written from scratch. Some of details are:

* **Window Manager**       :bento:                [Openbox](http://openbox.org/wiki/Main_Page) dual themes!
* **Shell**                :shell:                [Zsh](https://zsh.org) with [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) framework!
* **Terminal Emulator**    :leaves:               [URxvt](http://software.schmorp.de/pkg/rxvt-unicode.html) which lighter! 
* **Openbox Menu**         :cyclone:              [obmenu-generator](https://github.com/trizen/obmenu-generator) for lyfe!
* **Panel**                :blossom:              [Tint2](https://gitlab.com/o9000/tint2) with material design and glyphs!
* **Compositor**           :shaved_ice:           [Picom](https://github.com/yshui/picom) for perfection topping!
* **Notification Daemon**  :herb:                 [Dunst](https://github.com/dunst-project/dunst) which minimalist!
* **Application Launcher** :rocket:               [Rofi](https://github.com/davatorium/rofi) which blazing fast!
* **File Manager**         :flower_playing_cards: [Thunar](https://github.com/xfce-mirror/thunar) customized side-pane!
* **Media Player**         :city_sunset:          [mpv](https://mpv.io/) with modern OSC!
* **Music Player**         :milky_way:            [Ncmpcpp](https://github.com/ncmpcpp/ncmpcpp) with album-art!
* **GUI Basic-IDE**        :space_invader:        [Geany](https://geany.org) for the win! :P

<h1>
  <a href="#---------1">
    <img alt="" align="right" src="https://img.shields.io/github/commit-activity/m/owl4ce/dotfiles/ng?style=flat-square&label=&color=000000&logo=gitbook&logoColor=white&labelColor=000000"/>
  </a>
</h1>

<br>

<div align="center">

```ocaml
CLICK OR TAP ❲☰❳ TO SHOW TABLE-OF-CONTENTS
```

</div>

## :fallen_leaf: ‎ <samp>CHANGELOGS</samp>

> Work in progress.

## :ear_of_rice: ‎ <samp>INTRODUCTION OF LINUX RICE</samp>

> Work in progress.

## :seedling: ‎ <samp>SETUP</samp>

Everything done manually step-by-step. Let's learn.

### :blossom: ‎ <samp>INSTALLATION (DEPENDENCIES)</samp>

<details>
<summary><b>Debian-based Linux distributions</b></summary>

<br>

> Debian SID or Devuan Ceres recommended.

**Didn't know how to install packages?**

```sh
💲 sudo apt install <pkg1> <pkg2> <..>
```

---

**X server and {it's,core} utilities. This is essentials.**

```sh
xserver-xorg-core x11-xserver-utils psmisc
```

Contents of [1](https://packages.debian.org/sid/xserver-xorg-core), [2](https://packages.debian.org/sid/x11-xserver-utils), [3](https://packages.debian.org/sid/psmisc).

[Here for python (3) if not already installed](https://wiki.debian.org/Python).

---

**Now, the UI kits and functionality. It's required.**

URxvt is a highly recommended terminal emulator by default. Picom is optional, but recommended.

```sh
dunst nitrogen openbox rofi rxvt-unicode tint2 picom libgtk3-perl #obmenu-generator
```

Contents of [1](https://packages.debian.org/sid/dunst), [2](https://packages.debian.org/sid/nitrogen), [3](https://packages.debian.org/sid/openbox), [4](https://packages.debian.org/sid/rofi), [5](https://packages.debian.org/sid/rxvt-unicode), [6](https://packages.debian.org/sid/tint2), [7](https://packages.debian.org/sid/picom), [8](https://packages.debian.org/sid/libgtk3-perl).

[Here to install obmenu-generator](https://software.opensuse.org/download.html?project=home%3AHead_on_a_Stick%3Aobmenu-generator&package=obmenu-generator).

---

**Audio-server and audio stuffs.**

I personally use pulseaudio, mpd and ncmpcpp are recommended because integrated by default.

```sh
pulseaudio mpd mpc ncmpcpp
```

Contents of [1](https://packages.debian.org/sid/pulseaudio), [2](https://packages.debian.org/sid/mpd), [3](https://packages.debian.org/sid/mpc), [4](https://packages.debian.org/sid/ncmpcpp).

Spotify is also integrated but optional, [here to install](https://spotify.com/us/download/linux).

---

**Extended utilities. Required, but just as necessary.**

All of the below if not installed, certain functionality will display a message when it's needed, some are not.

```sh
alsa-utils brightnessctl imagemagick scrot w3m-img wireless-tools xclip xsettingsd xss-lock
```

Contents of [1](https://packages.debian.org/sid/alsa-utils), [2](https://packages.debian.org/sid/brightnessctl), [3](https://packages.debian.org/sid/imagemagick), [4](https://packages.debian.org/sid/scrot), [5](https://packages.debian.org/sid/w3m-img), [6](https://packages.debian.org/sid/wireless-tools), [7](https://packages.debian.org/sid/xclip), [8](https://packages.debian.org/sid/xsettingsd), [9](https://packages.debian.org/sid/xss-lock).

Choose your own polkit authentication-agent. [lxpolkit](https://packages.debian.org/sid/lxpolkit)?

---

**Optionals for completion of desktop compositions.**

Just like mpd and ncmpcpp, configurations are included as [EXTRA_JOYFUL](./EXTRA_JOYFUL), some are integrated.

```sh
thunar thunar-archive-plugin thunar-volman ffmpegthumbnailer tumbler
```

Contents of [1](https://packages.debian.org/sid/thunar), [2](https://packages.debian.org/sid/thunar-archive-plugin), [3](https://packages.debian.org/sid/thunar-volman), [4](https://packages.debian.org/sid/ffmpegthumbnailer), [5](https://packages.debian.org/sid/tumbler).

Gsimplecal used to display calender pop-ups from tint2 panel, and pavucontrol to control pulseaudio-sinks.

```sh
geany geany-plugins gimp gsimplecal inkscape mpv parcellite pavucontrol viewnior xfce4-power-manager
```

Contents of [1](https://packages.debian.org/sid/geany), [2](https://packages.debian.org/sid/geany-plugins), [3](https://packages.debian.org/sid/gimp), [4](https://packages.debian.org/sid/gsimplecal), [5](https://packages.debian.org/sid/inkscape), [6](https://packages.debian.org/sid/mpv), [7](https://packages.debian.org/sid/parcellite), [8](https://packages.debian.org/sid/pavucontrol), [9](https://packages.debian.org/sid/viewnior), [10](https://packages.debian.org/sid/xfce4-power-manager).

I personally don't use neofetch anymore since already use system-information via rofi, it's already scripted.

```sh
htop nano #neofetch
```

Contents of [1](https://packages.debian.org/sid/htop), [2](https://packages.debian.org/sid/nano), [3](https://packages.debian.org/sid/neofetch).

[Here for improved nanorc with syntax-highlighting](https://github.com/scopatz/nanorc).

I personally use NetworkManager (and IWD as wireless back-end) with nm-applet, [here is it](https://wiki.debian.org/NetworkManager).

</details>

<details>
<summary><b>Arch-based Linux distributions</b></summary>

<br>

> Arch Linux and Artix Linux recommended.

**Didn't know how to install packages?**

```sh
💲 sudo pacman -S <pkg1> <pkg2> <..>
```

---

**X server and {it's,core} utilities. This is essentials.**

```sh
xorg-server xorg-xrandr xorg-xrdb psmisc
```

Contents of [1](https://archlinux.org/packages/extra/x86_64/xorg-server), [2](https://archlinux.org/packages/extra/x86_64/xorg-xrandr), [3](https://archlinux.org/packages/extra/x86_64/xorg-xrdb), [4](https://archlinux.org/packages/core/x86_64/psmisc).

[Here for python (3) if not already installed](https://wiki.archlinux.org/title/python).

---

**Now, the UI kits and functionality. It's required.**

URxvt is a highly recommended terminal emulator by default. Picom is optional, but recommended.

> **AUR**  
> `rxvt-unicode-truecolor-wide-glyphs`  
> `obmenu-generator`

```sh
dunst nitrogen openbox rofi rxvt-unicode-truecolor-wide-glyphs tint2 picom obmenu-generator perl-gtk3
```

Contents of [1](https://archlinux.org/packages/community/x86_64/dunst), [2](https://archlinux.org/packages/extra/x86_64/nitrogen), [3](https://archlinux.org/packages/community/x86_64/openbox), [4](https://archlinux.org/packages/community/x86_64/rofi), [5](https://aur.archlinux.org/packages/rxvt-unicode-truecolor-wide-glyphs), [6](https://archlinux.org/packages/community/x86_64/tint2), [7](https://archlinux.org/packages/community/x86_64/picom), [8](https://aur.archlinux.org/packages/obmenu-generator), [9](https://archlinux.org/packages/community/any/perl-gtk3).

---

**Audio-server and audio stuffs.**

I personally use pulseaudio, mpd and ncmpcpp are recommended because integrated by default.

```sh
pulseaudio pulseaudio-alsa mpd mpc ncmpcpp
```

Contents of [1](https://archlinux.org/packages/extra/x86_64/pulseaudio), [2](https://archlinux.org/packages/extra/x86_64/pulseaudio-alsa), [3](https://archlinux.org/packages/extra/x86_64/mpd), [4](https://archlinux.org/packages/extra/x86_64/mpc), [5](https://archlinux.org/packages/community/x86_64/ncmpcpp).

Spotify is also integrated but optional, [here to install](https://wiki.archlinux.org/title/spotify).

---

**Extended utilities. Required, but just as necessary.**

All of the below if not installed, certain functionality will display a message when it's needed, some are not.

```sh
alsa-utils brightnessctl imagemagick scrot w3m wireless_tools xclip xsettingsd xss-lock
```

Contents of [1](https://archlinux.org/packages/extra/x86_64/alsa-utils), [2](https://archlinux.org/packages/community/x86_64/brightnessctl), [3](https://archlinux.org/packages/extra/x86_64/imagemagick), [4](https://archlinux.org/packages/community/x86_64/scrot), [5](https://archlinux.org/packages/extra/x86_64/w3m), [6](https://archlinux.org/packages/core/x86_64/wireless_tools), [7](https://archlinux.org/packages/extra/x86_64/xclip), [8](https://archlinux.org/packages/community/x86_64/xsettingsd), [9](https://archlinux.org/packages/community/x86_64/xss-lock).

Choose your own polkit authentication-agent. [polkit-gnome](https://archlinux.org/packages/community/x86_64/polkit-gnome)?

---

**Optionals for completion of desktop compositions.**

Just like mpd and ncmpcpp, configurations are included as [EXTRA_JOYFUL](./EXTRA_JOYFUL), some are integrated.

```sh
thunar thunar-archive-plugin thunar-volman ffmpegthumbnailer tumbler
```

Contents of [1](https://archlinux.org/packages/extra/x86_64/thunar), [2](https://archlinux.org/packages/extra/x86_64/thunar-archive-plugin), [3](https://archlinux.org/packages/extra/x86_64/thunar-volman), [4](https://archlinux.org/packages/extra/x86_64/ffmpegthumbnailer), [5](https://archlinux.org/packages/extra/x86_64/tumbler).

Gsimplecal used to display calender pop-ups from tint2 panel, and pavucontrol to control pulseaudio-sinks.

```sh
geany geany-plugins gimp gsimplecal inkscape mpv parcellite pavucontrol viewnior xfce4-power-manager
```

Contents of [1](https://archlinux.org/packages/community/x86_64/geany), [2](https://archlinux.org/packages/community/x86_64/geany-plugins), [3](https://archlinux.org/packages/extra/x86_64/gimp), [4](https://archlinux.org/packages/community/x86_64/gsimplecal), [5](https://archlinux.org/packages/extra/x86_64/inkscape), [6](https://archlinux.org/packages/community/x86_64/mpv), [7](https://archlinux.org/packages/community/x86_64/parcellite), [8](https://archlinux.org/packages/extra/x86_64/pavucontrol), [9](https://archlinux.org/packages/community/x86_64/viewnior), [10](https://archlinux.org/packages/extra/x86_64/xfce4-power-manager).

I personally don't use neofetch anymore since already use system-information via rofi, it's already scripted.

```sh
htop nano #neofetch
```

Contents of [1](https://archlinux.org/packages/extra/x86_64/htop), [2](https://archlinux.org/packages/core/x86_64/nano), [3](https://archlinux.org/packages/community/any/neofetch).

[Here for improved nanorc with syntax-highlighting](https://github.com/scopatz/nanorc).

I personally use NetworkManager (and IWD as wireless back-end) with nm-applet, [here is it](https://wiki.archlinux.org/title/NetworkManager#Front-ends).

</details>

<details>
<summary><b>Gentoo source-based Linux distribution</b></summary>

<br>

> Gentoo Linux extremely recommended. Expert!

**Didn't know how to install packages?**

```sh
💲 doas emerge -av <pkg1> <pkg2> <..>
```

> Note that some packages require accepting [arch~ keywords](https://wiki.gentoo.org/wiki/ACCEPT_KEYWORDS). It's highly recommended.

> See also USE flags, it's complicated to explain. [You might want to see mine](https://github.com/owl4ce/hmg/tree/main/etc/portage).

---

**X server and it's utilities. This is essentials.**

```sh
x11-base/xorg-server x11-apps/xrandr
```

Contents of [1](https://packages.gentoo.org/packages/x11-base/xorg-server), [2](https://packages.gentoo.org/packages/x11-apps/xrandr).

---

**Now, the UI kits and functionality. It's required.**

URxvt is a highly recommended terminal emulator by default. Picom is optional, but recommended.

> My own portage overlay. **Nelumbonaceae Overlay**  
> `=x11-terms/rxvt-unicode-9.26-r9:0::nelumbonaceae`

```sh
x11-misc/dunst x11-misc/nitrogen x11-wm/openbox x11-misc/rofi =x11-terms/rxvt-unicode-9.26-r9:0::nelumbonaceae x11-misc/tint2 =x11-misc/picom-9999 x11-misc/obmenu-generator dev-perl/Gtk3
```

Contents of [1](https://packages.gentoo.org/packages/x11-misc/dunst), [2](https://packages.gentoo.org/packages/x11-misc/nitrogen), [3](https://packages.gentoo.org/packages/x11-wm/openbox), [4](https://packages.gentoo.org/packages/x11-misc/rofi), [5](https://github.com/owl4ce/nelumbonaceae/tree/main/x11-terms/rxvt-unicode), [6](https://packages.gentoo.org/packages/x11-misc/tint2), [7](https://packages.gentoo.org/packages/x11-misc/picom), [8](https://packages.gentoo.org/packages/x11-misc/obmenu-generator), [9](https://packages.gentoo.org/packages/dev-perl/Gtk3).

---

**Audio-server and audio stuffs.**

I personally use pulseaudio, mpd and ncmpcpp are recommended because integrated by default.

```sh
media-sound/pulseaudio media-sound/mpd media-sound/mpc media-sound/ncmpcpp
```

Contents of [1](https://packages.gentoo.org/packages/media-sound/pulseaudio), [2](https://packages.gentoo.org/packages/media-sound/mpd), [3](https://packages.gentoo.org/packages/media-sound/mpc), [4](https://packages.gentoo.org/packages/media-sound/ncmpcpp).

Spotify is also integrated but optional, [here to install](https://wiki.gentoo.org/wiki/Spotify).

---

**Extended utilities. Required, but just as necessary.**

All of the below if not installed, certain functionality will display a message when it's needed, some are not.

> I personally don't use this portage overlay and build manually instead. **GURU Overlay**  
> `app-misc/brightnessctl`

```sh
app-misc/brightnessctl media-gfx/imagemagick media-gfx/scrot www-client/w3m net-wireless/wireless-tools x11-misc/xclip x11-misc/xsettingsd x11-misc/xss-lock
```

Contents of [1](https://gitweb.gentoo.org/repo/proj/guru.git/tree/app-misc/brightnessctl), [2](https://packages.gentoo.org/packages/media-gfx/imagemagick), [3](https://packages.gentoo.org/packages/media-gfx/scrot), [4](https://packages.gentoo.org/packages/www-client/w3m), [5](https://packages.gentoo.org/packages/net-wireless/wireless-tools), [6](https://packages.gentoo.org/packages/x11-misc/xclip), [7](https://packages.gentoo.org/packages/x11-misc/xsettingsd), [8](https://packages.gentoo.org/packages/x11-misc/xss-lock).

Choose your own polkit authentication-agent. [polkit-gnome](https://packages.gentoo.org/packages/gnome-extra/polkit-gnome)?

---

**Optionals for completion of desktop compositions.**

Just like mpd and ncmpcpp, configurations are included as [EXTRA_JOYFUL](./EXTRA_JOYFUL), some are integrated.

```sh
xfce-base/thunar xfce-extra/thunar-archive-plugin xfce-extra/thunar-volman media-video/ffmpegthumbnailer xfce-extra/tumbler
```

Contents of [1](https://packages.gentoo.org/packages/xfce-base/thunar), [2](https://packages.gentoo.org/packages/xfce-extra/thunar-archive-plugin), [3](https://packages.gentoo.org/packages/xfce-extra/thunar-volman), [4](https://packages.gentoo.org/packages/media-video/ffmpegthumbnailer), [5](https://packages.gentoo.org/packages/xfce-extra/tumbler).

Gsimplecal used to display calender pop-ups from tint2 panel, and pavucontrol to control pulseaudio-sinks.

> I personally don't use this portage overlay and build manually instead. **Miramir's Overlay**  
> `x11-misc/gsimplecal`

```sh
dev-util/geany dev-util/geany-plugins media-gfx/gimp x11-misc/gsimplecal media-gfx/inkscape media-video/mpv x11-misc/parcellite media-sound/pavucontrol media-gfx/viewnior xfce-extra/xfce4-power-manager
```

Contents of [1](https://packages.gentoo.org/packages/dev-util/geany), [2](https://packages.gentoo.org/packages/dev-util/geany-plugins), [3](https://packages.gentoo.org/packages/media-gfx/gimp), [4](https://github.com/miramir/miramir-layman/tree/master/x11-misc/gsimplecal), [5](https://packages.gentoo.org/packages/media-gfx/inkscape), [6](https://packages.gentoo.org/packages/media-video/mpv), [7](https://packages.gentoo.org/packages/x11-misc/parcellite), [8](https://packages.gentoo.org/packages/media-sound/pavucontrol), [9](https://packages.gentoo.org/packages/media-gfx/viewnior), [10](https://packages.gentoo.org/packages/xfce-extra/xfce4-power-manager).

I personally don't use neofetch anymore since already use system-information via rofi, it's already scripted.

```sh
sys-process/htop #app-misc/neofetch
```

Contents of [1](https://packages.gentoo.org/packages/sys-process/htop), [2](https://packages.gentoo.org/packages/app-misc/neofetch).

[Here for improved nanorc with syntax-highlighting](https://github.com/scopatz/nanorc).

I personally use NetworkManager (and IWD as wireless back-end) with nm-applet, [here is it](https://wiki.gentoo.org/wiki/NetworkManager#GTK_GUIs).

</details>

<details>
<summary><b>Another independent Linux distribution</b></summary>

<br>

> Need contributors to encapsulate dependencies.

<pre align="center">
The Linux philosophy is ‘Laugh in the face of danger’.
Oops. Wrong One. ‘Do it yourself’.

- Linus Torvalds
</pre>

</details>

<details>
<summary><b>Optionally Z shell with OMZ plugins</b></summary>

<br>

Install zsh with system package-manager as described in the above-step before (or [OMZ wiki](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)). Then OMZ.

```sh
💲 sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Set zsh as default login shell if desired (via chsh) and install extremely useful OMZ plugins for the win. :D

```sh
💲 sudo chsh -s $(command -v zsh)
```

```sh
💲 git clone --depth 1 https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
```

```sh
💲 git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

```sh
💲 git clone --depth 1 https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
```

</details>

### :cherry_blossom: ‎ <samp>INSTALLATION (DOTFILES)</samp>

> Work in progress.

### :sunflower: ‎ <samp>SYNC FOR UPDATES</samp>

> Work in progress.

## :herb: ‎ <samp>GUIDES</samp>

> Work in progress.

### :tanabata_tree: ‎ <samp>ADDITIONALS</samp>

> Work in progress.

## :maple_leaf: ‎ <samp>HISTORY</samp>

This started since the COVID-19 pandemic [..](https://github.com/owl4ce/dotfiles/wiki/My-Linux-Ricing-Journey) the story is too long, what's clear is that I always improvise everything from day-to-day, month-to-month, and year-to-year. My main philosophy in building this is as a minimal replacement for "bloated" Desktop Environment without any desktop decorations e.g icons and widgets, but customizable to users' taste with an overall theme based on my unnamed color palette and easily switchable themes along with fashion.

I learned a lot about \*NIX because of this too, so I'm really grateful for that. I really hope that everyone can learn open-source especially in \*NIX environment such as GNU/Linux and can leave the world of "pirated software" completely, which is in very poor condition, especially among Microsoft Windows consumers.

If you feel happy, give this a **star**. If there's a problem with the configuration (please check previous issues if any), you can create an [issue](https://github.com/owl4ce/dotfiles/issues) or if you want to [discuss](https://github.com/owl4ce/dotfiles/discussions). Thank you so much for reading!

<pre align="center">
<a href="#maple_leaf--history">
<img alt="" width="96%" src="https://api.star-history.com/svg?repos=owl4ce/dotfiles&type=Date"/>
</a>
</pre>

## :tulip: ‎ <samp>TIP JAR</samp>

If you enjoyed it and would like to show your appreciation, you may want to tip me here.

It's never required but always wholeheartedly appreciated.

Thank you so much from the bottom of my heart! ‎ :heartpulse:

[![](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/V7V05ZACS)
[![](https://liberapay.com/assets/widgets/donate.svg)](https://liberapay.com/owl4ce/donate)

## :four_leaf_clover: ‎ <samp>ACKNOWLEDGEMENTS</samp>

|           |   | **Inspiration and Resources**                       |                                                                                                                                                             |            |
|:---------:|:-:|:----------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------:|
|           | 1 | [Elena](https://github.com/elenapan)                |                                                                                                                                                             |            |
|           | 2 | [Adhi Pambudi](https://github.com/addy-dclxvi)      |                                                                                                                                                             |            |
|           | 3 | [Fikri Omar](https://github.com/fikriomar16)        |                                                                                                                                                             |            |
|           | 4 | [Rizqi Nur Assyaufi](https://github.com/bandithijo) |                                                                                                                                                             |            |
|           | 5 | [Muktazam Hasbi Ashidiqi](https://github.com/reorr) |                                                                                                                                                             |            |
|           | 6 | [Galih Wisnuaji](https://github.com/nekonako)       |                                                                                                                                                             |            |
|           | 7 | [Ghani Rafif](https://github.com/ekickx)            |                                                                                                                                                             |            |
|           | 8 | [Dylan Araps](https://github.com/dylanaraps)        |                                                                                                                                                             |            |
|           | 9 | [Niivu](https://github.com/niivu)                   |                                                                                                                                                             |            |
|           |   |                                                     |                                                                                                                                                             |            |
| **Group** |   | **Contributors**                                    | **Contributions**                                                                                                                                           | **Status** |
| Unlisted  | 1 | [Ekaunt](https://github.com/ekaunt)                 | [Better rofi prompt-menu](https://github.com/owl4ce/dotfiles/pull/2)                                                                                        | Obsolete   |
|           | 2 | [HopeBaron](https://github.com/HopeBaron)           | [Termite configuration](https://github.com/owl4ce/dotfiles/pull/4)                                                                                          | Obsolete   |
|           | 3 | [Justin Faber](https://github.com/vredesbyyrd)      | [Rofi matched-lines indicator](https://github.com/owl4ce/dotfiles/issues/33#issuecomment-753399179)                                                         | Used       |
|           | 4 | [Vcyzteen](https://github.com/vcyzteen)             | [URxvt copy-paste with eval](https://github.com/owl4ce/dotfiles/pull/67/files#diff-76ca8b85960fd14348e9caa3ebabe00c3cf21593a94036f4ba3305c262809a34R59-R60) | Used       |
| Verified  | * | [![](https://contrib.rocks/image?repo=owl4ce/dotfiles)](https://github.com/owl4ce/dotfiles/graphs/contributors)                                                                                                                |
|           |   |                                                     |                                                                                                                                                             |            |
| **Based** |   | **Community**                                       |                                                                                                                                                             |            |
|:indonesia:| 1 | [Linuxer Desktop Art](https://facebook.com/groups/linuxart)                                                                                                                                                                    |
|           | 2 | [@dotfiles_id](https://t.me/dotfiles_id)                                                                                                                                                                                       |
|:world_map:| 3 | [r/unixp*rn](https://reddit.com/r/unixporn)                                                                                                                                                                                    |

## :deciduous_tree: ‎ <samp>CONTRIBUTING</samp>

[Read here](./CONTRIBUTING.md).

## :jack_o_lantern: ‎ <samp>SECURITY POLICY</samp>

[Read here](./SECURITY.md).
