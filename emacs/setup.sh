#!/bin/bash
if [ -d ~/.emacs.d ]; then
    rm -rf ~/.emacs.d
fi
ln -s $PWD/.emacs.d ~
