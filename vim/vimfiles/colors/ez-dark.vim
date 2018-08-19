" :hi
set background=dark
hi clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name='ez-dark'

" Remove all highlighting
highlight clear Comment
highlight clear Constant
highlight clear CursorColumn
highlight clear Identifier
highlight clear MatchParen
highlight clear Number
highlight clear PreProc
highlight clear Search
highlight clear Special
highlight clear String
highlight clear Statement
highlight clear Type

highlight Normal ctermbg=0 ctermfg=15 guibg=#000000 guifg=#ffffff

highlight ColorColumn ctermbg=238 guibg=#444444
highlight Comment ctermfg=87 guifg=#5fffff
highlight CursorLine ctermbg=238 guibg=#444444
highlight CursorLineNr cterm=bold ctermfg=4 gui=bold guifg=#ffff5f
highlight LineNr ctermfg=4 guifg=#ffff5f
highlight MatchParen cterm=bold ctermbg=89 gui=bold guibg=#87005f
highlight String ctermfg=207 guifg=#ff5fff
highlight Search cterm=bold ctermbg=207 ctermfg=15 gui=bold guibg=#ff5fff guifg=#ffffff
highlight Statement ctermfg=227 guifg=#ffff5f
highlight StorageClass ctermfg=227 guifg=#ffff5f
highlight Structure ctermfg=227 guifg=#ffff5f
highlight Visual ctermbg=33 ctermfg=15 guibg=#0087ff guifg=#000000
highlight Pmenu ctermbg=238 ctermfg=15 guibg=#444444 guifg=#ffffff
highlight PmenuSel cterm=bold ctermbg=238 ctermfg=15 gui=bold guibg=#444444 guifg=#ffffff
