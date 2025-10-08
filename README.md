
sudo npm install -g pyright
npm install -g prettier











---


~/.config/picom/picom.conf
```
backend = "glx";
vsync = true;

# Opacidad global (ejemplo 95%)
inactive-opacity = 0.95;
active-opacity = 1.0;

# Opacidad específica para kitty
opacity-rule = [
  "85:class_g = 'kitty'"
];
################################
# Background-Blurring
################################
# blur-background = false;
# blur-method = "dual_kawase";
# blur-size = 100; # Set your desired blur size
# blur-strength = 100; # Set your desired blur strength

```


sudo pacman -S wlogout

sudo pacman -S gammastep # gammastep -O 3500 -b 0.9

sudo pacman -S swaylock
sudo pacman -S swaylock-effects

~/.config/swaylock/config
```
daemonize
show-failed-attempts
clock
screenshot
effect-blur=15x15
effect-vignette=1:1
color=1f1d2e80
font="Inter"
indicator
indicator-radius=200
indicator-thickness=20
line-color=11111b
ring-color=181825
inside-color=1e1e1e
key-hl-color=cba6f7
separator-color=00000000
text-color=cdd6f4
text-caps-lock-color=""
line-ver-color=11111b
ring-ver-color=cba6f7
inside-ver-color=1e1e2e
text-ver-color=cdd6f4
ring-wrong-color=f38ba8
text-wrong-color=f38ba8
inside-wrong-color=1e1e2e
inside-clear-color=1e1e2e
text-clear-color=cdd6f4
ring-clear-color=cba6f7
line-clear-color=11111b
line-wrong-color=11111b
bs-hl-color=f38ba8
grace=0
grace-no-touch
datestr=%a, %B %e
timestr=%I:%M %p
fade-in=0.3
ignore-empty-password
```


~/.config/hypr/hyprpaper.conf                                                                                                         ─╯
- reemplazar HDMI-A-1 por el valor de `hyprctl monitors`

``` 
preload = /ruta/imagen.jpg
wallpaper = HDMI-A-1,imagen.jpg
```

sudo pacman -S hyprpaper


pywalfox(firefox extension) + wal(kitty o alacritty): esquema de colores
https://github.com/Frewacom/pywalfox
sudo pacman -S python-pywal

 [sddm-eucalyptus-drop (GitLab)](https://gitlab.com/Matt.Jolly/sddm-eucalyptus-drop/)

   ```bash
   git clone https://gitlab.com/Matt.Jolly/sddm-eucalyptus-drop.git


   sudo mkdir -p /usr/share/sddm/themes/sugar-candy
   sudo cp -r sddm-eucalyptus-drop/* /usr/share/sddm/themes/sugar-candy/

   sudo mkdir -p /etc/sddm.conf.d
   echo -e "[Theme]\nCurrent=sugar-candy" | sudo tee /etc/sddm.conf.d/theme.conf
   sudo pacman -S qt5-graphicaleffects qt5-quickcontrols2
   ```
cambiar wallpaper a sddm

```
sudo mkdir -p /usr/share/sddm/themes/sugar-candy/backgrounds
sudo cp ~/wallpapers/wallpaper.jpg /usr/share/sddm/themes/sugar-candy/backgrounds/
#actualizar archivo
/usr/share/sddm/themes/sugar-candy/theme.conf

ejemplo:
[General]
Background="backgrounds/wallpaper.jpg"

sudo systemctl restart sddm

```



## compilar nvim desde código:

Asegúrate de haber instalado todo:

```bash
sudo apt install ninja-build gettext cmake unzip curl build-essential libtool libtool-bin autoconf automake pkg-config libuv1-dev libmsgpack-dev libunibilium-dev
```

Y luego compilar correctamente:

```bash
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=Release
sudo make install
```

Instalar fuentes necesarias para los iconos:

```
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh Hack
```

dentro de kitty.conf:
```
font_family Hack Nerd Font
```


---


## SETUP FZF 

```bash
sudo apt install fzf -y
```

fix ctrl-r binding
- Bash

Append this line to ~/.bashrc to enable fzf keybindings for Bash:

   source /usr/share/doc/fzf/examples/key-bindings.bash

Append this line to ~/.bashrc to enable fuzzy auto-completion for Bash:

   source /usr/share/doc/fzf/examples/completion.bash

- Zsh

Append this line to ~/.zshrc to enable fzf keybindings for Zsh:

   source /usr/share/doc/fzf/examples/key-bindings.zsh

Append this line to ~/.zshrc to enable fuzzy auto-completion for Zsh:

   source /usr/share/doc/fzf/examples/completion.zsh


# KITTY config


```bash
cd dot-files
cp kitty/kitty.conf ~/.config/kitty/kitty.conf #tema para kitty
```

## zshell + ohmyzsh

### instalar zshell

```bash
sudo apt install zsh
chsh -s $(which zsh)
```

### instalar ohmyzsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Instalar tema personalizado para zsh

original: https://github.com/Daivasmara/daivasmara.zsh-theme/tree/master

```bash
cp kitty/daivasmara.zsh-theme ~/.oh-my-zsh/themes # tema para zsh
```

luego actualizar la variable

```bash
ZSH_THEME="daivasmara"
```

### instalar zsh-autosuggestions

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Actualizar variable plugins en ~/.zshrc

```bash
plugins=(git zsh-autosuggestions)
```

### Instalar https://github.com/lsd-rs/lsd 
Un "ls" con mejoras visuales: iconos, colores, etc
```bash
sudo apt update -y
sudo apt install lsd
sudo apt --fix-broken install
```


# FastFetch

Compilarlo:

```bash
sudo apt install git cmake build-essential libwayland-client0 libx11-dev libxft-dev libxcb1-dev

git clone https://github.com/fastfetch-cli/fastfetch.git
cd fastfetch
mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install
```
