from scripts.subprocess_wrapper import run_script

links = {
    "/etc/X11/xorg.conf.d/30-touchpad.conf": "30-touchpad.conf",
    "/etc/acpi/events/lid": "lid",
    "/etc/acpi/actions/lid.sh": "lid.sh"
}

note = """acpid, tlp
# disable pc speaker
echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
"""


def setup():
    run_script("laptop.sh")
