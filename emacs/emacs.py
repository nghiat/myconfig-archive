from scripts.envvar import set_envvar
from scripts.subprocess_wrapper import run_command
import os

colors_templates = {
    "./.emacs.d/ez-theme.el.template": "./.emacs.d/ez-theme.el",
    "./.emacs.d/ez-dark-theme.el.template": "./.emacs.d/ez-dark-theme.el"
}

links = {
    "~/.emacs.d": ".emacs.d",
    "~/.globalrc": ".globalrc"
}

note = """pip install yapf
hunspell en-us de-de-frami fr"""


def setup():
    set_envvar("GTAGSCONF", ".globalrc")
    if os.name == "nt":
        run_command(
            "copy .emacs.d/init.d/init-local.el.template .emacs.d/init.d/init-local.el")
    else:
        run_command(
            "cp .emacs.d/init.d/init-local.el.template .emacs.d/init.d/init-local.el")
