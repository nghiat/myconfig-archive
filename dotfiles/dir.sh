#!/bin/bash
dirs=(
    "$HOME/.config"
    "$HOME/.config/fish"
    "$HOME/.config/termite"

    "$HOME/.config/i3"
    "$HOME/.config/dunst"
    "$HOME/.config/rofi"
    "$HOME/.config/polybar"
    "/etc/X11/xorg.conf.d"
    "/etc/acpi/events"
    "/etc/acpi/actions"
)

for dir in "${dirs[@]}"; do
    if [ ! -d "$dir" ]; then
	echo "mkdir $dir"
        sudo mkdir -p $dir
    fi
done
