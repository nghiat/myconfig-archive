note = """gnome-control-center gnome-tweak-tool
gnome-shell gdm chrome-gnome-shell-git gnome-system-monitor
dconf dump /org/gnome/ > backup.txt
dconf load /org/gnome/ < backup.txt
"""
