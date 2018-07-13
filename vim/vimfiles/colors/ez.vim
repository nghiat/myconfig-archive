"Inspimaroon by chromium code search: https://cs.chromium.org
set background=light
hi clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name='ez'

" Remove all highlighting
highlight clear Comment
highlight clear Constant
highlight clear CursorColumn
highlight clear CursorLine
highlight clear Identifier
highlight clear MatchParen
highlight clear Number
highlight clear PreProc
highlight clear Search
highlight clear Special
highlight clear String
highlight clear Statement
highlight clear Type

let s:black = '#000000'
let s:maroon = '#800000'
let s:green = '#008000'
let s:navy = '#000080'
let s:grey89 = '#e4e4e4'

exe 'highlight Comment guifg='.s:maroon
exe 'highlight String guifg='.s:green
exe 'highlight ColorColumn guibg='.s:grey89
exe 'highlight MatchParen gui=bold guibg='.s:grey89
exe 'highlight Search gui=bold guibg='.s:grey89
exe 'highlight LineNr guifg=Navy'
exe 'highlight CursorLineNr gui=bold guifg='.s:navy