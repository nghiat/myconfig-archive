"Inspired by chromium code search: https://cs.chromium.org
set background=light
hi clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name='ez'

" Remove all highlighting
highlight clear Constant
highlight clear Number
highlight clear Statement
highlight clear PreProc
highlight clear Type
highlight clear Special
highlight clear Identifier
highlight clear MatchParen
highlight clear String
highlight clear Comment
highlight clear Search
highlight clear CursorLine
highlight clear CursorColumn

let s:black = '#000000'
let s:red = '#880000'
let s:green = '#008800'
let s:blue = '#000088'
let s:hlsearch = '#38D878'

exe 'highlight Comment guifg='.s:red
exe 'highlight String guifg='.s:green
exe 'highlight Statement guifg='.s:blue
exe 'highlight Structure guifg='.s:blue
exe 'highlight StorageClass guifg='.s:blue
exe 'highlight MatchParen gui=bold guibg='.s:hlsearch
exe 'highlight Search gui=bold guibg='.s:hlsearch
