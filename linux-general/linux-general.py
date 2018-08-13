from scripts.subprocess_wrapper import run_script, run_command

colors_templates = {
    ".Xdefaults.template": "~/.Xdefaults",
}

links = {
    "~/.tmux.conf": ".tmux.conf",
    "~/.xprofile": ".xprofile",
    "/etc/X11/xorg.conf.d/00-custom-kdb.conf": "00-custom-kdb.conf",
    "~/.bashrc": ".bashrc",
    "~/.bash_profile": ".bash_profile",
    "~/.inputrc": ".inputrc",
    "~/.xbindkeysrc": ".xbindkeysrc",
    "~/.config/mpv/mpv.conf": "mpv.conf",
}

note = '''
tmux
xsel
urxvt
redshift-gtk
python-xdg
xbindkeys
mpv
ibus: Ubuntu im-config, Untick Use system keyboard layout
tmux <prefix>-I'''


def setup():
    run_script("change-power-settings.sh")
    run_command("git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm")
    # Intel vtune
    run_command("echo kernel.yama.ptrace_scope=0 | sudo tee /etc/sysctl.d/10-ptrace.conf > /dev/null")
