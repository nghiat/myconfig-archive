#!/bin/bash
#emacs
if [ -d ~/.emacs.d ]; then
    rm -rf ~/.emacs.d
fi
ln -s $PWD/emacs/.emacs.d ~

ln -s $PWD/emacs/.globalrc ~
if [[ "$SHELL" =~ "bash" ]]; then
    export GTAGSCONF="$HOME/myconfig/.globalrc"
elif [[ "$SHELL" =~ "fish" ]]; then
    fish -c "set -gx GTAGGCONF $HOME/myconfig/.globalrc"
fi

#vim
ln -s $PWD/vim/vimrc $HOME/.vimrc
ln -s $PWD/vim/vimfiles $HOME/.vim
