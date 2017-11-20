#!/bin/bash
script_dir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")
source $script_dir/../export_vars.sh
source $script_dir/../utils/parse_args.sh "$@"
laptop_symlink=(
    "/etc/X11/xorg.conf.d/30-touchpad.conf"
    "/etc/acpi/events/lid"
    "/etc/acpi/actions/lid.sh"
)

if [ "$clean" = true ]; then
    bash $script_dir/../utils/create_symlink.sh --clean ${laptop_symlink[@]}
    systemctl disable acpid
    exit 0
fi

bash $script_dir/../utils/create_symlink.sh ${laptop_symlink[@]}
sudo systemctl enable acpid
echo -e "${Red}acpi${Nc}"
