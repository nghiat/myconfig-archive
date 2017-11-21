#!/bin/bash
script_dir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")
source ${script_dir}/../export_vars.sh
print_help() {
    echo "create_symlink.sh symlink..."
    echo options:
    echo "  --clean"
}

if [ "$#" -eq "0" ]; then
    print_help
    exit 1
fi
clean=""
while true; do
    case "$1" in
        --clean ) clean="true"; shift ;;
        * ) break ;;
    esac
done
num_files=$#
for file in "$@"; do
    src="$config_root_dir/config/$file"
    des=${file/home/~}
    if [ "$clean" = true ]; then
        if [ -L "$des" ]; then
            echo -e "${Red} deleting $des ${Nc}"
            sudo rm $des
        fi
    else
        if [ ! -L "$des" ]; then
	    sudo ln -s $src $des
	    echo -e "${Blue} sudo $src ---> $des ${Nc}"
        fi
    fi
done
