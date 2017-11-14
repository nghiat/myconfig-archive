#!/bin/bash
Red="\033[0;31m"
Blue="\033[1;34m"
Yellow="\033[1;33m"
Nc="\033[0m"
declare -A dirs=(
    ["config"]="$HOME/.config"
    ["fish"]="$HOME/.config/fish"
    ["termite"]="$HOME/.config/termite"

    ["i3"]="$HOME/.config/i3"
    ["dunst"]="$HOME/.config/dunst"
    ["rofi"]="$HOME/.config/rofi"
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
)

declare -A sudo_symlink=(
    ["i3lock-blur.service"]="/etc/systemd/system"
)

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
                sudo ln -s $src $des
                echo -e "${Blue} sudo $src ---> $des ${Nc}"
            else
                ln -s $src $des
                echo -e "${Blue} $src ---> $des ${Nc}"
            fi
        fi
    done
}

setup() {
    for name in "${!dirs[@]}"; do
        dir="${dirs[$name]}"
        if [ ! -d "$dir" ]; then
            mkdir -p $dir
        fi
    done

    create_symlink_from_array "" "symlink"
    create_symlink_from_array "true" "sudo_symlink"
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
}

case "$1" in
    "")
        setup
        echo -e "${Yellow} Remember to install dunst i3lock-blur rofi ${Nc}"
        ;;
    "clean")
        clean
        ;;
    "help")
        echo "conf.sh [ | clean]"
        ;;
    *)
        ;;
esac
