import os
import platform
from scripts.subprocess_wrapper import run_command

extension_ids = [
    "christian-kohler.path-intellisense",
    "donjayamanne.githistory",
    "HookyQR.beautify",
    "ms-python.python",
    "ms-vscode.cpptools",
    "npclaudiu.vscode-gn",
    "robertohuertasm.vscode-icons",
    "vscodevim.vim",
    "xaver.clang-format",
]

files = ["keybindings.json", "settings.json"]


def create_links(prefix_path):
    results = {}
    for filename in files:
        results[os.path.join(prefix_path, filename)] = filename
    return results


if platform.system() == "Windows":
    links = create_links("~/AppData/Roaming/Code/User")
elif platform.system() == "Linux":
    links = create_links("~/.config/Code/User")
elif platform.system() == "Darwin":
    links = create_links("~/Library/Application Support/Code/User")


def setup():
    for id in extension_ids:
        run_command("code --install-extension " + id)


def clean():
    for id in extension_ids:
        run_command("code --uninstall-extension " + id)
