import os
import subprocess


def run_command(args):
    sp = subprocess.Popen(args,
                          stdout=subprocess.PIPE,
                          stderr=subprocess.STDOUT)
    print(sp.communicate()[0].decode("utf-8", "ignore"))


def run_script(script_path):
    abs_path = os.path.abspath(script_path)
    print("Running script: " + abs_path)
    run_command([abs_path])
