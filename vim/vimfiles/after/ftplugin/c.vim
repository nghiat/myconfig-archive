setlocal shiftwidth=2
setlocal softtabstop=2
setlocal makeprg=gcc\ -o\ %<\ %
noremap <F6> :w <bar> make<CR>
inoremap <F6> <C-O>:w <bar> make<CR>
if has("win32")
    nnoremap <F5> :!%<<CR>
    inoremap <F5> <C-O>:!%<<CR>
elseif has("unix")
    nnoremap <F5> :!./%<<CR>
    inoremap <F5> <C-O>:!./%<<CR>
endif
