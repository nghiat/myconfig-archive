import os

colors_templates = {
        "./vimfiles/colors/ez.vim.template": "./vimfiles/colors/ez.vim"
}

links = {
    "~/.vimrc": "vimrc",
}

if os.name == "nt":
    links["~/vimfiles"] = "vimfiles"
else:
    links["~/.vim"] = "vimfiles"
