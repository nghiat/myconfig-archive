#!/bin/bash
mkdir -p $HOME/.config/{i3,dunst,rofi,fish}
if [ ! -d $HOME/.config/xfce4/terminal/colorschemes]; then
  mkdir -p $HOME/.config/xfce4/terminal/colorschemes
fi
ln -s $PWD/dunstrc $HOME/.config/dunst
ln -s $PWD/{i3blocks.conf,i3lock-blur.sh} $HOME/.config/i3
ln -s $PWD/i3-config $HOME/.config/i3/config
ln -s $PWD/temperature $HOME/.config/i3/temperature
ln -s $PWD/rofi-config $HOME/.config/rofi/config
ln -s $PWD/{.xinitrc,.xserverrc} $HOME
ln -s $PWD/config.fish $HOME/.config/fish/config.fish
ln -s $PWD/.Xmodmap $HOME
ln -s $PWD/gruvbox.theme $HOME/.config/xfce4/terminal/colorschemes
sudo ln -s $PWD/i3lock-blur.service /etc/systemd/system/
sudo systemctl enable i3lock-blur
