<p align="center"><a name="top" href="#octocat-hi-there-thanks-for-visiting"><img height="60%" width="100%" src="https://i.ibb.co/qdnJT5M/dotfiles.png"></a></p>

<p align="center">
<a href="#setup"><img width="120px" style="padding: 0 10px;" src="https://i.ibb.co/b5DYRxb/setup.png"></a>
<a href="https://github.com/owl4ce/dotfiles/wiki/Keybinds"><img width="120px" style="padding: 0 10px;" src="https://i.ibb.co/VVc5S9d/keybinds.png"></a>
<a href="https://github.com/owl4ce/dotfiles/wiki/Gallery"><img width="120px" style="padding: 0 10px;" src="https://i.ibb.co/C1sdMw9/gallery.png"></a>
<a href="#notes"><img width="120px" style="padding: 0 10px;" src="https://i.ibb.co/g75Z25g/notes.png"></a>
</p>

##  
### :octocat: Hi there! Thanks for visiting!

<img src="https://i.ibb.co/QcYdfx8/X-Thumbnail.jpg" alt="stuck-in-stack.thumbnail" align="right" width="400px">

This is my personal configuration for my favorite openbox window manager and some applications too.

I hope you understand everything here. :wink:

Here are some details about my setup:
- **WM**                           : [Openbox](http://openbox.org/wiki/Main_Page) :art: 2 changable themes!
- **DM**                           : [SLiM](https://wiki.archlinux.org/index.php/SLiM) :gift: login themes like UI Web!
- **Shell**                        : [zsh](https://wiki.archlinux.org/index.php/zsh) :wrench: with [oh my zsh](https://github.com/ohmyzsh/ohmyzsh) framework!
- **Terminal**                     : [URxvt](https://wiki.archlinux.org/index.php/Rxvt-unicode)
- **Openbox Menu**                 : [obmenu-generator](https://github.com/trizen/obmenu-generator)
- **Panel**                        : [tint2](https://wiki.archlinux.org/index.php/Tint2) :shaved_ice: material icon font!
- **Compositor**                   : [Picom](https://github.com/yshui/picom)
- **Notify Daemon**                : [dunst](https://wiki.archlinux.org/index.php/Dunst) :bookmark: minimalist!
- **Application Launcher**         : [rofi](https://github.com/davatorium/rofi) :rocket: apps & sidebar menu!
- **File Manager**                 : [Thunar](https://wiki.archlinux.org/index.php/Thunar) :milky_way: customized sidebar & icon!
- **Text Editor**                  : [Geany](https://www.geany.org/), nano, vim

## Changelogs
- **New scripts**:
1. OB button location switcher
2. Wallpaper changer
3. Add border background with shadow in scrot selection mode
               
- **New wallpapers** (can be added by yourself)

- **Reconfigure**:
1. Openbox (default location of ob button & wallpaper) \
*Can be changed easily!*
2. Tint2 (new look on eyecandy on the right side) \
*Add new scripts shortcut for OB button location switcher & wallpaper changer.*
3. GIMP-2.10 (little changes)
4. SLiM (font size & location)
5. Cava default color (red) \
*Not using gradients anymore so you can change color with the <kbd>F</kbd> key.*
6. Color Toys (bloks) \
*Like addy-dclxvi style!*
7. Picom \
*Using picom instead of picom rounded from ibhagwan and sdhand because some devices have memory leak.*
8. Obmenu-generator (new look) \
*Add new scripts shortcut for OB button location switcher & wallpaper changer.*
9. Ncmcpcpp album art scripts \
*Linked mpd dir to every ncmpcpp config.*
10. Get brightness scripts \
*Display percentages well.*
11. Zsh theme (new look)
12. Geany \
*Fix the blind color scheme and plugin.*
13. Sweetly GTK Theme \
*Fix wrong color hex.*
                   
- **Delete all unnecessary comments on the scripts**

Look in the gallery and [workflow](https://www.youtube.com/watch?v=5zLJO6UyZFw&t=3s) for more details.

## Setup
## <p align="center">:construction_worker: README UNDER MAINTENANCE :construction_worker:</p>

## Notes
### <p align="center">Detailed Environment</p>
| Items                  | Values                                                                                               |
|------------------------|------------------------------------------------------------------------------------------------------|
| Audio Volume Control   | [pamixer](https://github.com/cdemoulins/pamixer)                                                     |
| Sound Mixer            | pulseaudio                                                                                           |
| Volume Control         | pavucontrol                                                                                          |
| Brightness Handler     | [brightnessctl](https://github.com/Hummer12007/brightnessctl)                                        |
| Wallpaper Setter       | nitrogen                                                                                             |
| Power Manager          | xfce4-power-manager                                                                                  |
| Lockscreen             | slimlock (from slim display manager)                                                                 |
| Sessions Locker        | [xss-lock](https://wiki.archlinux.org/index.php/Session_lock#xss-lock)                               |
| Clipboard Manager      | clipit, xclip                                                                                        |
| Calendar Pop-up        | gsimplecal (for pop-up from tint2)                                                                   |
| Authentication Agent   | polkit-gnome-authentication-agent-1                                                                  |
| Network Manager        | NetworkManager + [networkmanager_dmenu](https://github.com/firecat53/networkmanager-dmenu)           |
| QT Themer              | qt5ct (adapted to the GTK Theme)                                                                     |
| GTK Themer             | lxappearance                                                                                         |
| Audio Visualizer       | [cava](https://github.com/karlstav/cava)                                                             |
| Screenshot App         | scrot                                                                                                |
| Web Browser            | google-chrome-stable                                                                                 |
| Image Viewer           | viewnior                                                                                             |
| Music Player           | audacious & spotify + [spicetify](https://github.com/khanhas/spicetify-cli)                          |
| Video Player           | mpv                                                                                                  |
| Graphic Editor         | gimp-2.10                                                                                            |
| CLI Music Player       | mpd, mpc, ncmpcpp                                                                                    |
| CLI File Manager       | ranger                                                                                               |
| CLI System Monitor     | htop                                                                                                 |
| CLI System Information | neofetch                                                                                             |
##  
### <p align="center">Color Scheme</p>
<p align="center"><a name="top" href="#notes"><img height="60%" width="100%" src="https://i.ibb.co/kHRHZfX/color-scheme.png"></a></p>

## Credits / Thanks
- [Elenapan](https://github.com/elenapan)
- [Adhi Pambudi](https://github.com/addy-dclxvi)
- [Rizqi Nur Assyaufi](https://github.com/bandithijo)
- [Fikri Omar](https://github.com/fikriomar16)
- [Muktazam Hasbi Ashidiqi](https://github.com/reorr)
- [Galih Wisnuaji](https://github.com/galihx11)
- [Aditya Shakya](https://github.com/adi1090x)
- Our local linux community [Linuxer Desktop Art](https://web.facebook.com/groups/linuxart) and [r/unixporn](https://www.reddit.com/r/unixporn/).
- Some people in the forum who provide solutions.
- All artists (especially [Kuvshinov Ilya](https://www.artstation.com/kuvshinov_ilya) for his work that I show on the Thunar sidebar and [his](https://weheartit.com/entry/124014293) art for neofetch) who make pictures, illustrations, and wallpapers. By the way [this](https://drive.google.com/drive/folders/1fFseELgArlOGAAeUY32EO98dAU0ITjJ2?usp=sharing) is my wallpaper collection.
