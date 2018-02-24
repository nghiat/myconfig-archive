from subprocess_wrapper import run_command
import os


def set_envvar_windows(name, value):
    run_command(["setx", name, value])


def set_envvar_bash_like(name, value):
    run_command(["export", name + "=" + "value"])


def set_envvar_fish(name, value):
    command = '"set -gx ' + name + ' ' + 'value"'
    run_command(["fish", "-c", command])


def set_envvar_unix(name, value):
    shell = os.getenv("SHELL")
    if "fish" in shell:
        return
    elif "/sh" in shell or "bash" in shell or "zsh" in shell:
        set_envvar_bash_like(name, value)


def set_envvar(name, value):
    value = os.path.abspath(os.path.expanduser(value))
    print("Setting environment variable: " + name + "=" + value)
    if os.name == "nt":
        set_envvar_windows(name, value)
    #else:
    #    set_envvar_unix(name, value)


def set_envvars(maps):
    for name, value in maps.items():
        set_envvar(name, value)
