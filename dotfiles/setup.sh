#!/bin/bash
export Red="\033[0;31m"
export Blue="\033[1;34m"
export Yellow="\033[1;33m"
export Nc="\033[0m"

declare -A dirs=(
    ["config"]="$HOME/.config"
    ["fish"]="$HOME/.config/fish"
    ["termite"]="$HOME/.config/termite"

    ["i3"]="$HOME/.config/i3"
    ["dunst"]="$HOME/.config/dunst"
    ["rofi"]="$HOME/.config/rofi"
    ["xorg.conf.d"]="/etc/X11/xorg.conf.d"
    ["acpi"]="/etc/acpi/events"
    ["acpi_actions"]="/etc/acpi/actions"
)

declare -A symlink=(
    ["config.fish"]="${dirs[fish]}"
    ["termite-config"]="${dirs[termite]}/config"
    [".tmux.conf"]="$HOME"

    ["dunstrc"]="${dirs[dunst]}"
    ["i3blocks.conf"]="${dirs[i3]}"
    ["i3lock-blur.sh"]="${dirs[i3]}"
    ["i3-config"]="${dirs[i3]}/config"
    ["temperature"]="${dirs[i3]}"
    [".xinitrc"]="$HOME"
    [".xserverrc"]="$HOME"
    [".Xresources"]="$HOME"
    ["gruvbox-dark.xresources"]="$HOME"
)

declare -A sudo_symlink=(
    ["i3lock-blur.service"]="/etc/systemd/system"
)

declare -A laptop_sudo_symlink=(
    ["30-touchpad.conf"]="${dirs[xorg.conf.d]}"
    ["lid"]="${dirs[acpi]}"
    ["lid.sh"]="${dirs[acpi_actions]}"
)

is_laptop=false

get_distro() {
    id=$(cat /etc/*-release | grep ID=)
    echo "${id:3}"
}

create_symlink_from_array() {
    need_sudo="${1}"
    var=$(declare -p "${2}")
    eval "declare -A array="${var#*=}
    for name in "${!array[@]}"; do
        src="$name"
        des="${array[$name]}"
        if [ -d "$des" ]; then
            des="$des/$src"
        fi
        if [ ! -L "$des" ]; then
            if [ "$need_sudo" = true ]; then
                sudo ln -s $PWD/$src $des
                echo -e "${Blue} sudo $src ---> $des ${Nc}"
            else
                ln -s $PWD/$src $des
                echo -e "${Blue} $src ---> $des ${Nc}"
            fi
        fi
    done
}

setup() {
    if [ -d /sys/module/battery ]; then
        is_laptop=true
        sudo systemctl enable acpid
    fi
    for name in "${!dirs[@]}"; do
        dir="${dirs[$name]}"
        if [ ! -d "$dir" ]; then
            sudo mkdir -p $dir
        fi
    done

    create_symlink_from_array "" "symlink"
    create_symlink_from_array "true" "sudo_symlink"
    if [ "$is_laptop" = true ]; then
        create_symlink_from_array "true" "laptop_sudo_symlink"
    fi
    sudo sed -i 's/#HandleLidSwitch=suspend.*/HandleLidSwitch=ignore/' /etc/systemd/logind.conf
    sudo sed -i 's/#HandlePowerKey.*/HandlePowerKey=suspend/' /etc/systemd/logind.conf
    sudo sed -i 's/#DefaultTimeoutStartSec.*/DefaultTimeoutStartSec=10s/' /etc/systemd/system.conf
    sudo sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=10s/' /etc/systemd/system.conf
    sudo systemctl daemon-reload
}

clean_from_array() {
    var=$(declare -p "${1}")
    eval "declare -A array="${var#*=}
    for name in "${!array[@]}"; do
        src="$name"
        des="${array[$name]}"
        if [ -d "$des" ]; then
            des="$des/$src"
        fi
        if [ -L "$des" ]; then
            echo -e "${Red} deleting $des ${Nc}"
            sudo rm $des
        fi
    done
}

clean() {
    clean_from_array "symlink"
    clean_from_array "sudo_symlink"
    if [ "$is_laptop" = true ]; then
        clean_from_array "laptop_sudo_symlink"
    fi
}

export distro=$(get_distro)

case "$1" in
    "")
        setup
        ;;
    "clean")
        clean
        ;;
    "install")
        bash $PWD/$distro.sh install
        ;;
    "uninstall")
        bash $PWD/$distro.sh uninstall
        ;;
    "help")
        echo "setup.sh [ | clean | install ]"
        ;;
    *)
        ;;
esac
