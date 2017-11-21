#!/bin/bash
script_dir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")
bash $script_dir/../export_vars.sh
source $script_dir/../utils/parse_args.sh "$@"

change_power_settings() {
    sudo sed -i 's/#HandleLidSwitch=suspend.*/HandleLidSwitch=ignore/' /etc/systemd/logind.conf
    sudo sed -i 's/#HandlePowerKey.*/HandlePowerKey=suspend/' /etc/systemd/logind.conf
    sudo sed -i 's/#DefaultTimeoutStartSec.*/DefaultTimeoutStartSec=10s/' /etc/systemd/system.conf
    sudo sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=10s/' /etc/systemd/system.conf
    sudo systemctl daemon-reload
}

general_symlink=(
    "/home/.tmux.conf"
    "/home/.config/fish/config.fish"
    "/home/.config/termite/config"
)

if [ "$clean" = true ]; then
    bash $script_dir/../utils/create_symlink.sh --clean ${general_symlink[@]}
    exit 0
fi

bash $script_dir/../utils/create_symlink.sh ${general_symlink[@]}
change_power_settings
echo -e "${Red}fish tmux xsel termite redshift gtk-theme-arc-git${Nc}"
