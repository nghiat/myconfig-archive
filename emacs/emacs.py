from scripts.envvar import set_envvar
links = {
    "~/.emacs.d": ".emacs.d",
    "~/.globalrc": ".globalrc"
}

note = "pip install jedi flake8 autopep8"


def setup():
    set_envvar("GTAGSCONF", ".globalrc")
