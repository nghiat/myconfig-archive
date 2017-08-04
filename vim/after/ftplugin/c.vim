setlocal shiftwidth=2
setlocal softtabstop=2
setlocal makeprg=gcc\ -o\ %<\ %
noremap <F6> :w <bar> make<CR>
inoremap <F6> <C-O>:w <bar> make<CR>
nnoremap <F5> :!%<<CR>
inoremap <F5> <C-O>:!%<<CR>
