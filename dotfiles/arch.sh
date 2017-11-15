#!/bin/bash
packages=(fish network-manager-applet compton dropbox redshift gnome-keyring
fsearch-git dunst i3blocks i3lock-blur rofi xorg-xset xautolock ibus
ibus-unikey ttf-font-awesome ttf-dejavu ranger polybar w3m xf86-input-synaptics
acpid)

is_package_installed() {
    local pkg=${1}
    if pacman -Qe $pkg > /dev/null 2>&1; then
        echo "installed"
    else
        echo ""
    fi
}

install() {
    for pkg in "${packages[@]}"; do
        if [ "$(is_package_installed $pkg)" ]; then
            yaourt -S $pkg --noconfirm
        fi
    done
}

uninstall() {
    for pkg in "${packages[@]}"; do
        if [ -n "$(is_package_installed $pkg)" ]; then
            echo -e "${Red}Uninstalling $pkg...${Nc}"
            sudo pacman -Rs $pkg
        fi
    done
}

setup() {
    
}

case "$1" in
    "install")
        install
        ;;
    "uninstall")
        uninstall
        ;;
    *)
        ;;
esac
