"Inspimaroon by chromium code search: https://cs.chromium.org
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
let s:maroon = '#800000'
let s:green = '#008000'
let s:grey89 = '#e4e4e4'

exe 'highlight Comment guifg='.s:maroon
exe 'highlight String guifg='.s:green
exe 'highlight Statement guifg='.s:black
exe 'highlight Structure guifg='.s:black
exe 'highlight StorageClass guifg='.s:black
exe 'highlight ColorColumn guibg='.s:grey89     
exe 'highlight MatchParen gui=bold guibg='.s:grey89
exe 'highlight Search gui=bold guibg='.s:grey89
