from scripts.subprocess_wrapper import run_script

links = {
    "~/.tmux.conf": ".tmux.conf",
    "~/.config/fish/config.fish": "config.fish",
    "~/.config/termite/config": "termite",
    "/etc/X11/xorg.conf.d/00-custom-kdb.conf": "00-custom-kdb.conf" 
}

note = 'fish tmux xsel termite redshift python-xdg gtk-theme-arc-git
setxkbmap -option "ctrl:nocaps"'


def setup():
   run_script("change-power-settings.sh")
