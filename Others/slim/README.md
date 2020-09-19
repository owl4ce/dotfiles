## Installation
1. Put all fonts in the **fonts** folder to */usr/share/fonts/* and refresh font cache
   ```bash
   fc-cache -r
   ```
2. Put **slim.conf** into */etc/*
3. Put the **custom** folder to */usr/share/slim/themes/*
4. Create symbolic link for slim background to *~/.wallpaper/slim.png*
   ```bash
   sudo ln -s ~/.wallpaper/slim.png /usr/share/slim/themes/custom/background.png
   ```

Slim requires [.xinitrc](./.xinitrc) to execute WM/DE sessions. So, put [.xinitrc](./.xinitrc) to user's home directory.
```bash
cp .xinitrc ~/
```
More information is available on the [Arch Wiki](https://wiki.archlinux.org/index.php/SLiM).

## Additional configuration
> Edit the **slim.conf** file.
- Screenshots - <kbd>F11</kbd>
  ```cfg
  screenshot_cmd      scrot -e 'mv $f /home/username/Pictures/'
  ```

<img src="https://i.ibb.co/dWKLVQc/2020-09-19-012206-1366x768-scrot.png" alt="custom.slim" align="center">

<br>

If you want a slim **bluesky** theme it's also available at [bluesky.tar.xz](./bluesky.tar.xz).
<img src="https://i.ibb.co/YbmmDvk/SLi-M-Bluesky.png" alt="bluesky.slimlock" align="center">
