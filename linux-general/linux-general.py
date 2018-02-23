from scripts.subprocess_wrapper import run_script

links = {
    "~/.tmux.conf": ".tmux.conf",
    "~/.config/fish/config.fish": "config.fish",
    "~/.config/termite/config": "termite",
    "/etc/X11/xorg.conf.d/90-custom-kdb.conf": "90-custom-kdb.conf" 
}

note = "fish tmux xsel termite redshift gtk-theme-arc-git"


def setup():
   run_script("change-power-settings.sh")
