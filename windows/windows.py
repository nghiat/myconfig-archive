import os
from scripts.subprocess_wrapper import run_command

note = """clink, autohotkey, vs-ez"""

colors_templates = {
    ".minttyrc.template": "~/.minttyrc"
}


def setup():
    current_folder = os.path.dirname(os.path.realpath(__file__))
    run_command("schtasks /CREATE /SC ONLOGON /TN Launch-Apps /TR {} /RL LIMITED".format(os.path.join(current_folder, "launch_apps.ahk")))
    run_command("schtasks /CREATE /SC ONLOGON /TN Misc /TR {} /RL HIGHEST".format(os.path.join(current_folder, "misc.ahk")))
