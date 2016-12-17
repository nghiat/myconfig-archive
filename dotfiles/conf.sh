#!/bin/sh
mkdir -p $HOME/.config/{i3,dunst,rofi}
ln -s $PWD/dunstrc $HOME/.config/dunst
ln -s $PWD/{i3blocks.conf,i3lock-blur.sh} $HOME/.config/i3
ln -s $PWD/i3-config $HOME/.config/i3/config
ln -s $PWD/rofi-config $HOME/.config/rofi/config
ln -s $PWD/{.xinitrc,.xserverrc} $HOME
sudo ln -s $PWD/i3lock-blur.service /etc/systemd/system/
sudo systemctl enable i3lock-blur
