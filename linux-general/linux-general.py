from scripts.subprocess_wrapper import run_script, run_command

links = {
    "~/.tmux.conf": ".tmux.conf",
    "~/.xprofile": ".xprofile",
    "~/.config/termite/config": "termite",
    "/etc/X11/xorg.conf.d/00-custom-kdb.conf": "00-custom-kdb.conf",
    "~/.zshrc": ".zshrc"
}

note = '''zsh tmux xsel termite redshift-gtk python-xdg gtk-theme-arc-git
setxkbmap -option "ctrl:nocaps"'''


def setup():
    run_script("change-power-settings.sh")
    run_command("git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh")
    run_command("git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions")
    run_command("sed -i 's/%c/%d/g' ~/.oh-my-zsh/themes/robbyrussell.zsh-theme")


def clean():
    run_command("rm -rf ~/.oh-my-zsh")
