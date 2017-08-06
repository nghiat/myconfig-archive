#!/bin/bash
ln -s $PWD/vimrc $HOME/.vimrc
if [ ! -d $HOME/.vim/autoload ]; then
  mkdir -p $HOME/.vim/autoload
fi
ln -s $PWD/ftplugin $HOME/.vim/ftplugin
ln -s $PWD/after $HOME/.vim/after
ln -s $PWD/plug.vim $HOME/.vim/autoload/plug.vim
