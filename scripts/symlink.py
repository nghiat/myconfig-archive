from .subprocess_wrapper import run_command
import os


def is_symlink_need_root(symlink):
    if os.name == "nt":
        return False
    expanded_symlink = os.path.expanduser(symlink)
    if expanded_symlink == symlink:
        return True
    return False


def create_symlink(target, symlink):
    target = os.path.abspath(target)
    expanded_symlink = os.path.expanduser(symlink)
    symlink_prefix = expanded_symlink[:expanded_symlink.rfind(
        os.path.basename(expanded_symlink))]
    if is_symlink_need_root(symlink):
        if not os.path.exists(symlink_prefix):
            run_command("sudo mkdir -p " + symlink_prefix)
        run_command("sudo ln -s " + target + " " + expanded_symlink)
        return
    if not os.path.exists(symlink_prefix):
        os.makedirs(symlink_prefix, exist_ok=True)
    if os.path.exists(expanded_symlink):
        if os.path.islink(expanded_symlink):
            print("Symlink exists: " + expanded_symlink)
        else:
            print("File that is not a symlink exists: " + expanded_symlink)
    else:
        os.symlink(target, expanded_symlink)
        print("Symlink created: " + target + " -> " + expanded_symlink)


def delete_symlink(symlink):
    if is_symlink_need_root(symlink):
        run_command("sudo rm " + symlink)
        return
    symlink = os.path.expanduser(symlink)
    if os.path.islink(symlink):
        os.unlink(symlink)
        print("Deleted symlink: " + symlink)
    else:
        print(symlink + " is not a symlink")


# symlinks_targets_map because one target can have multliple symlinks
def create_symlinks(symlinks_targets_map):
    for symlink, target in symlinks_targets_map.items():
        create_symlink(target, symlink)


# symlinks_targets_map because one target can have multliple symlinks
def delete_symlinks(symlinks_targets_map):
    for symlink, target in symlinks_targets_map.items():
        delete_symlink(symlink)
