import os
from scripts.subprocess_wrapper import run_command

note = """Cmder, autohotkey, vs-ez
cmder/vender/clink.lua: search for cmder_prompt and comment clink.prompt.register_filter(git_prompt_filter)"""

links = {
    "~/.minttyrc": ".minttyrc"
}

def setup():
    current_folder = os.path.dirname(os.path.realpath(__file__))
    run_command("schtasks /CREATE /SC ONLOGON /TN Launch-Apps /TR {} /RL LIMITED".format(os.path.join(current_folder, "launch_apps.ahk")))
    run_command("schtasks /CREATE /SC ONLOGON /TN Misc /TR {} /RL HIGHEST".format(os.path.join(current_folder, "misc.ahk")))
