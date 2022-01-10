dotfiles
========

Managed using [dotdrop](https://github.com/deadc0de6/dotdrop).

![Screenshot](https://i.imgur.com/L6s9NaZ.png)


getting started
---------------

```
pip3 install --user docopt jinja2 PyYAML
cd dotfiles
./dotdrop.sh install
```


packages
--------


### All *NIX platforms

- [`fish`](https://fishshell.com) and [`fisher`](https://github.com/jorgebucaran/fisher) (primary shell)
- [`kitty`](https://github.com/kovidgoyal/kitty) (primary terminal emulator for X11 and MacOS)
- [`neovim`](https://neovim.io) (primary terminal-mode editor)
- [`nyaovim`](https://www.npmjs.com/package/nyaovim)
- [`rxvt-unicode`](http://software.schmorp.de/pkg/rxvt-unicode.html)
- [`barrier`](https://github.com/debauchee/barrier)
- [`ttf-input`](http://input.fontbureau.com)
- [`xonsh`](https://github.com/xonsh/xonsh)
- [`exa`](https://the.exa.website)
- [`ripgrep`](https://github.com/BurntSushi/ripgrep)
- [`nvm`](https://github.com/nvm-sh/nvm) (don't use distro package; install in `$HOME`)
- [`pyenv`](https://github.com/pyenv/pyenv) (don't use distro package; install in `$HOME`)
- [`htop`](http://hisham.hm/htop)
- [`pinfo`](http://pinfo.sourceforge.net)


### GNU/Linux only

(ArchLinux / Manjaro packages)

- [`foot`](https://codeberg.org/dnkl/foot) (primary terminal emulator for Wayland)
- [`autorandr`](https://github.com/phillipberndt/autorandr) (or [`randrctl`](https://github.com/edio/randrctl))
- [`compton`](https://github.com/chjj/compton)
- [`i3-scripts`](https://github.com/oberon2007/i3-scripts)
- [`i3-scrot`](https://aur.archlinux.org/packages/i3-scrot)
- [`i3-wm`](https://i3wm.org) (primary window manager on Linux)
- [`i3lock`](https://i3wm.org/i3lock)
- [`sway`](https://swaywm.org/) (primary compositor for Wayland)
- [`libnotify`](https://developer.gnome.org/notification-spec)
- [`neovim-qt`](https://github.com/equalsraf/neovim-qt) (primary GUI editor on Linux)
- [`nitrogen`](https://github.com/l3ib/nitrogen)
- [`polkit-gnome`](http://www.freedesktop.org/wiki/Software/polkit)
- [`ponymix`](http://github.com/falconindy/ponymix)
- [`rofi`](https://github.com/DaveDavenport/rofi)
- [`srandrd`](https://bitbucket.org/portix/srandrd)
- [`stalonetray`](http://stalonetray.sourceforge.net)
- [`systemd`](https://www.github.com/systemd/systemd) (running in `--user` mode to manage session-level apps)
- [`xcffibär`](https://github.com/whitelynx/xcffibaer)
- [`xfce4-notifyd`](http://goodies.xfce.org/projects/applications/xfce4-notifyd)
- [`xorg-xinput`](http://xorg.freedesktop.org)
- [`xorg-xrandr`](http://xorg.freedesktop.org)
- [`xorg-xset`](https://xorg.freedesktop.org)
- [`xclip`](https://github.com/astrand/xclip)
- [`xsel`](http://www.vergenet.net/~conrad/software/xsel)

#### Tray applications:

- [`network-manager-applet`](https://wiki.gnome.org/Projects/NetworkManager)
- [`pa-applet`](https://github.com/fernandotcl/pa-applet)
- [`blueman`](https://github.com/blueman-project/blueman)
- [`xfce4-power-manager`](http://www.xfce.org)
- [`pamac`](https://github.com/manjaro/pamac)
- [`clipit`](https://github.com/CristianHenzel/ClipIt)
- [`xflux-gui-git`](https://justgetflux.com/linux.html)


### macOS only

(mostly `brew` packages or direct installs)

- [`chunkwm`](https://github.com/koekeishiya/chunkwm) (primary window manager on macOS)
- [`khd`](https://github.com/koekeishiya/khd) (or [`skhd`](https://github.com/koekeishiya/skhd))
- [`vv`](https://github.com/igorgladkoborodov/vv) (primary GUI editor on macOS)
- [SteerMouse](http://plentycom.jp/en/steermouse/download.php) (tweaks to make external mice behave in a sane way)
