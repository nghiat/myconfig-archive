import os

links = {
    "~/.vimrc": "vimrc",
}

if os.name == "nt":
    links["~/vimfiles"] = "vimfiles"
else:
    links["~/.vim"] = "vimfiles"
