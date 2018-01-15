#!/bin/bash
if [ -d ~/.emacs.d ]; then
    rm -rf ~/.emacs.d
fi
ln -s $PWD/.emacs.d ~

ln -s $PWD/.globalrc ~
export GTAGSCONF="$HOME/myconfig/.globalrc"
