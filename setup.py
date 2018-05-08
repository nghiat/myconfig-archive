#! /usr/bin/env python3
from scripts.symlink import create_symlinks, delete_symlinks
import importlib
import os
import sys


def print_help():
    print("Available modules: ")
    for f in os.listdir():
        if os.path.isdir(f):
            if os.path.exists(f + "/" + f + ".py"):
                print(f)


if __name__ == "__main__":
    current_path = os.path.dirname(os.path.realpath(__file__))
    os.chdir(current_path)
    sys.path.append("scripts")
    if "--clean" in sys.argv:
        action = "clean"
    else:
        action = "setup"
    if len(sys.argv) == 1:
        print_help()
        sys.exit()
    all_notes = ""
    for module_name in sys.argv[1:]:
        if module_name[0].isalpha():
            module = importlib.import_module(module_name + "." + module_name)
            os.chdir(module_name)
            if hasattr(module, "links"):
                links = getattr(module, "links")
                if action == "setup":
                    # Default setup
                    create_symlinks(links)
                elif action == "clean":
                    # Default clean
                    delete_symlinks(links)
            if hasattr(module, action):
                print(module_name + "." + action)
                getattr(module, action)()
            if hasattr(module, "note"):
                module_note = getattr(module, "note")
                all_notes += module_note
                if not module_note[-1] == "\n":
                    all_notes += "\n"
            os.chdir(current_path)
    if all_notes:
        print("\nNotes: \n" + all_notes)
        f = open("setup.log", "w")
        f.write(all_notes)
