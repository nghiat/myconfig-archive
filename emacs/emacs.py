from scripts.envvar import set_envvar
from scripts.subprocess_wrapper import run_command
import os

links = {
    "~/.emacs.d": ".emacs.d",
    "~/.globalrc": ".globalrc"
}

note = "pip install jedi flake8 autopep8"


def setup():
    set_envvar("GTAGSCONF", ".globalrc")
    if os.name == "nt":
        run_command(
            "copy .emacs.d/init.d/init-local.el.template .emacs.d/init.d/init-local.el")
    else:
        run_command(
            "cp .emacs.d/init.d/init-local.el.template .emacs.d/init.d/init-local.el")
