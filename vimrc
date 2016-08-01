set nocompatible              " be iMproved, required
filetype off                  " required
syntax enable
set number
" set the runtime path to include Vundle and initialize
if has("unix")
    set rtp+=/home/nghia/.vim/bundle/Vundle.vim
    call vundle#begin('/home/nghia/.vim/bundle/')
else
    if has("win32")
        set rtp+=$HOME/.vim/bundle/Vundle.vim/
        call vundle#begin('$USERPROFILE/.vim/bundle/')
    endif
endif

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
"syntax checking
Plugin 'scrooloose/syntastic'
"auto closing quotes,...
Plugin 'raimondi/delimitmate'
"displays thin vertical lines at each identation level
Plugin 'yggdroot/indentline'
"Use tab to goes through Autocomplete
Plugin 'ervandew/supertab'
"Autocomplete popup
Plugin 'AutoComplPop'
"status bar
Plugin 'bling/vim-airline'
Plugin 'valloric/youcompleteme'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Toggle nerdtree
map <C-o> :NERDTreeToggle<CR>
"X11 clipboard
set clipboard=unnamedplus
"tab to spaces
set expandtab
set tabstop=4
"identation tab
set shiftwidth=4
"makes the backspace key treat the spaces like a tab
set softtabstop=4
"makes backspace work like most other apps
set backspace=indent,eol,start
let g:ycm_global_ycm_extra_conf = '$USERPROFILE/.ycm_extra_conf.py'
let g:rehash256 = 1
colorscheme molokai
"syntastic syntax checking
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set softtabstop=4
set encoding=utf-8

