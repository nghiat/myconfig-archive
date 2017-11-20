#!/bin/bash
script_dir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")
source $script_dir/../export_vars.sh
bash $script_dir/../utils/parse_args.sh "$@"
i3_symlink=(
    "/home/.xinitrc"
    "/home/.xserverrc"
    "/home/.Xresources"
    "/home/gruvbox-dark.xresources"
    "/home/.config/dunst/dunstrc"
    "/home/.config/i3/config"
    "/home/.config/i3/i3blocks.conf"
    "/home/.config/polybar/config"
    "/home/.config/rofi/config"
    "/etc/systemd/system/i3lock-blur.service"
)

if [ "$clean" = true ]; then
    bash $script_dir/../utils/create_symlink.sh --clean ${i3_symlink[@]}
    exit 0
fi

bash $script_dir/../utils/create_symlink_from_array.sh ${i3_symlink[@]}
echo -e "${Red}fish network-manager-applet compton dropbox redshift gnome-keyring
fsearch-git dunst i3blocks i3lock-blur rofi xorg-xset xautolock ibus
ibus-unikey ttf-font-awesome ttf-dejavu ranger polybar w3m xf86-input-synaptics
acpid python-xdg xsel xorg-xbacklight pulseaudio arandr${Nc}"

