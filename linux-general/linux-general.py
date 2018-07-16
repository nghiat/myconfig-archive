from scripts.subprocess_wrapper import run_script, run_command

colors_templates = {
    ".Xdefaults.template": "~/.Xdefaults",
}

links = {
    "~/.tmux.conf": ".tmux.conf",
    "~/.xprofile": ".xprofile",
    "~/.config/termite/config": "termite",
    "/etc/X11/xorg.conf.d/00-custom-kdb.conf": "00-custom-kdb.conf",
    "~/.zshrc": ".zshrc",
    "~/.bashrc": ".bashrc",
    "~/.inputrc": ".inputrc",
}

note = '''zsh tmux xsel urxvt redshift-gtk python-xdg
ibus: Ubuntu im-config, Untick Use system keyboard layout
tmux <prefix>-I
setxkbmap -option "ctrl:nocaps"'''


def setup():
    run_script("change-power-settings.sh")
    # run_command("git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh")
    # run_command("git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions")
    # run_command("sed -i 's/%c/%d/g' ~/.oh-my-zsh/themes/robbyrussell.zsh-theme")
    run_command("dconf load /apps/guake/ < ~/myconfig/linux-general/guake.conf")
    run_command("git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm")
    run_command("echo kernel.yama.ptrace_scope=0 | sudo tee /etc/sysctl.d/10-ptrace.conf > /dev/null")

def clean():
    run_command("rm -rf ~/.oh-my-zsh")
