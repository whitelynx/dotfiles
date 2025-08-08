dotfiles
========

Managed using [dotdrop](https://github.com/deadc0de6/dotdrop).

![Screenshot](https://i.imgur.com/L6s9NaZ.png)


getting started
---------------

### Using [poetry](https://python-poetry.org/):
```bash
cd dotfiles
poetry install
./dotdrop.sh install
```

**Note:** On some systems, dotdrop may not correctly determine the virtualenv to use; in these cases, you can specify `DOTDROP_VIRTUALENV`:
```bash
DOTDROP_VIRTUALENV=(poetry env info -p) ./dotdrop.sh install
```

### Using another Python environment:
```bash
cd dotfiles
pip3 install -r dotdrop/requirements.txt --user
./dotdrop.sh install
```


post-install
------------

After installing the packages and dotfiles, there's some manual setup commands that need to be run:

### NeoVim

My NeoVim config requires at least version 0.11.0. You might need to use [the Neovim Unstable PPA][] on Debian derivatives.

It also requires some way of managing Python virtual environments; I use `pyenv` here.

There's a few additional steps to get everything installed that my NeoVim config uses:

```bash
pyenv virtualenv default neovim
pyenv activate neovim
pip install pynvim neovim pyflakes yapf
ln -s (pyenv which pyflakes) (pyenv which yapf) ~/bin/
paru -S helm-ls-bin yaml-language-server php terraform-ls
npm install -g awk-language-server bash-language-server dockerfile-language-server-nodejs @microsoft/compose-language-service fish-lsp vscode-langservers-extracted perlnavigator-server typescript typescript-language-server svelte-language-server sql-language-server vim-language-server @vue/language-server
cargo install gitlab-ci-ls openscad-lsp tree-sitter-cli
go install github.com/arduino/arduino-language-server@latest github.com/wader/jq-lsp@master
~/.pyenv/versions/neovim/bin/pip install nginx-language-server "python-lsp-server[yapf]" rope
curl -Lo ~/bin/phpactor https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar; chmod +x ~/bin/phpactor
rustup component add rust-analyzer
```

[the Neovim Unstable PPA]: https://launchpad.net/~neovim-ppa/+archive/ubuntu/unstable

### Vim
- Install `vim-plug`:
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
- Start `vim`.
- Run `:PlugInstall` inside `vim`.

### fish

- `curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher`
- `cp ~/dotfiles/dotfiles/config/fish/fish_plugins ~/.config/fish/`
- `fisher update`


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
- [`otf-league-mono`](https://www.theleagueofmoveabletype.com/league-mono)
- [`xonsh`](https://github.com/xonsh/xonsh)
- [`eza`](https://eza.rocks/)
- [`ripgrep`](https://github.com/BurntSushi/ripgrep)
- [`nvm`](https://github.com/nvm-sh/nvm) (don't use distro package; install in `$HOME`)
- [`pyenv`](https://github.com/pyenv/pyenv) (don't use distro package; install in `$HOME`)
- [`htop`](http://hisham.hm/htop)
- [`pinfo`](http://pinfo.sourceforge.net)
- [`jq`](https://stedolan.github.io/jq/)
- [`yq`](https://github.com/kislyuk/yq)


### GNU/Linux only

(ArchLinux / Manjaro packages)

- [`libnotify`](https://developer.gnome.org/notification-spec)
- [`neovim-qt`](https://github.com/equalsraf/neovim-qt) (primary GUI editor on Linux)
- [`lxqt-policykit`](https://github.com/lxqt/lxqt-policykit)
- [`ponymix`](http://github.com/falconindy/ponymix)
- [`rofi`](https://github.com/DaveDavenport/rofi) (or [`rofi-lbonn-wayland`](https://github.com/lbonn/rofi) if on Wayland)
- [`bemoji`](https://github.com/marty-oehme/bemoji) (previously used [`rofimoji`](https://github.com/fdw/rofimoji))
- [`stalonetray`](http://stalonetray.sourceforge.net)
- [`systemd`](https://www.github.com/systemd/systemd) (running in `--user` mode to manage session-level apps)
- [`xfce4-notifyd`](http://goodies.xfce.org/projects/applications/xfce4-notifyd)
- [`xorg-xinput`](http://xorg.freedesktop.org)
- [`xorg-xrandr`](http://xorg.freedesktop.org)
- [`xorg-xset`](https://xorg.freedesktop.org)
- [`xclip`](https://github.com/astrand/xclip)
- [`xsel`](http://www.vergenet.net/~conrad/software/xsel)
- [`xvkbd`](http://t-sato.in.coocan.jp/xvkbd/) (or [`xdotool`](https://www.semicomplete.com/projects/xdotool/), but that doesn't work correctly with alternate keymaps)
- [`xcursor-breeze`](https://store.kde.org/p/999927)
- [`matcha-gtk-theme`](https://vinceliuice.github.io/theme-matcha.html)
- [`ttf-roboto`](https://material.google.com/style/typography.html)

#### For X11 only:
- [`i3-wm`](https://i3wm.org) (primary window manager on X11)
- [`i3-scripts`](https://github.com/oberon2007/i3-scripts)
- [`i3-scrot`](https://aur.archlinux.org/packages/i3-scrot)
- [`i3lock`](https://i3wm.org/i3lock)
- [`nitrogen`](https://github.com/l3ib/nitrogen)
- [`xcffibär`](https://github.com/whitelynx/xcffibaer) (status bar for X11)
- [`picom`](https://github.com/yshui/picom)
- [`autorandr`](https://github.com/phillipberndt/autorandr) (or [`randrctl`](https://github.com/edio/randrctl))
- [`srandrd`](https://bitbucket.org/portix/srandrd)

#### For Wayland only:
- [`foot`](https://codeberg.org/dnkl/foot) (primary terminal emulator for Wayland)
- [`sway`](https://swaywm.org/) (primary compositor for Wayland)
- [`swaybg`](https://github.com/swaywm/swaybg)
- [`swayidle`](https://github.com/swaywm/swayidle)
- [`swaylock`](https://github.com/swaywm/swaylock)
- [`waybar`](https://github.com/Alexays/Waybar/) (new status bar for Wayland)
- [`i3blocks`](https://github.com/vivien/i3blocks) (old status bar for Wayland)
- [`grim`](https://github.com/emersion/grim)
- [`slurp`](https://github.com/emersion/slurp)
- [`grimshot`](https://github.com/swaywm/sway)
- [`mako`](https://mako-project.org)
- [`wl-clipboard`](https://github.com/bugaevc/wl-clipboard)
- [`fuzzel`](https://codeberg.org/dnkl/fuzzel) (previously used [`rofi-lbonn-wayland`](https://github.com/lbonn/rofi))
- [`i3wins`](https://github.com/ylmrx/i3wins)
- [`sbdp`](https://github.com/boredland/sbdp)
- [`imv`](https://sr.ht/~exec64/imv/)

##### Optional, currently unused:
- [`wf-recorder`](https://github.com/ammen99/wf-recorder)
- [`wtype`](https://github.com/atx/wtype)
- [`kanshi`](https://wayland.emersion.fr/kanshi/)

#### Tray applications:

- [`network-manager-applet`](https://wiki.gnome.org/Projects/NetworkManager)
- [`pa-applet`](https://github.com/fernandotcl/pa-applet)
- [`blueman`](https://github.com/blueman-project/blueman)
- [`xfce4-power-manager`](http://www.xfce.org)
- [`pamac`](https://github.com/manjaro/pamac)


### macOS only

(mostly `brew` packages or direct installs)

- [`chunkwm`](https://github.com/koekeishiya/chunkwm) (primary window manager on macOS)
- [`khd`](https://github.com/koekeishiya/khd) (or [`skhd`](https://github.com/koekeishiya/skhd))
- [`vv`](https://github.com/igorgladkoborodov/vv) (primary GUI editor on macOS)
- [SteerMouse](http://plentycom.jp/en/steermouse/download.php) (tweaks to make external mice behave in a sane way)
