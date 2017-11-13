#!/bin/bash
mkdir -p $HOME/.config/{fish,termite}
ln -s $PWD/config.fish $HOME/.config/fish/config.fish
ln -s $PWD/termite-config $HOME/.config/termite/config
ln -s $PWD/{.tmux.conf} $HOME
echo Remember to install: fish termite
while true; do
    read -p "i3 support?" yn
    case $yn in
        [Yy]* ) 
            mkdir -p $HOME/.config/{i3,dunst,rofi}
            ln -s $PWD/dunstrc $HOME/.config/dunst
            ln -s $PWD/{i3blocks.conf,i3lock-blur.sh} $HOME/.config/i3
            ln -s $PWD/i3-config $HOME/.config/i3/config
            ln -s $PWD/temperature $HOME/.config/i3/temperature
            ln -s $PWD/rofi-config $HOME/.config/rofi/config
            ln -s $PWD/{.xinitrc,.xserverrc} $HOME
            sudo ln -s $PWD/i3lock-blur.service /etc/systemd/system/
            sudo systemctl enable i3lock-blur
            echo Remember to install xsel dunst rofi xinit i3lock-blur
            ;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
