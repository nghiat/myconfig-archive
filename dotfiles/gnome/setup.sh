#!/bin/bash
script_dir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")
source $script_dir/../export_vars.sh
source $script_dir/../utils/parse_args.sh "$@"
echo -e "${Red}gnome-control-center gnome-tweak-tool gnome-shell gdm${Nc}"
echo -e "${Red}dconf load /org/gnome/ < backup.txt${Nc}"
