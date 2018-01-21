#!/bin/bash
#emacs
if [ -d ~/.emacs.d ]; then
    rm -rf ~/.emacs.d
fi
ln -s $PWD/emacs/.emacs.d ~

ln -s $PWD/emacs/.globalrc ~
export GTAGSCONF="$HOME/myconfig/.globalrc"

#vim
ln -s $PWD/vim/vimrc $HOME/.vimrc
ln -s $PWD/vim/vimfiles $HOME/.vim
