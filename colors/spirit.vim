" Vim color file
" Maintainer:   acevery@gmail.com
" Last Change:  2011-1-30
" URL:                   


" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="spirit"

hi Normal       guifg=#f0f0f0 guibg=#00071A
hi LineNr       guifg=#82A9DC gui=italic,bold

" highlight groups
hi Cursor       guibg=#f0f0f0 guifg=#00071A
hi CursorLine guibg=#000F38 ctermbg=lightgray
hi CursorColumn guibg=#000F38 ctermbg=lightgray
hi VertSplit guibg=#C0FFFF guifg=#075554 gui=none
hi Folded               guibg=#C0CCFF guifg=black
hi FoldColumn   guibg=#800080 guifg=tan
"hi IncSearch   cterm=none ctermbg=blue ctermfg=grey guifg=slategrey guibg=khaki
hi ModeMsg guifg=#404040 guibg=#C0C0C0
hi MoreMsg guifg=darkturquoise guibg=#188F90
hi NonText guibg=#334C75 guifg=#9FADC5
hi Question     guifg=#F4BB7E
hi Search guibg=#B3B300 guifg=bg
hi SpecialKey   guifg=#BF9261
hi StatusLine   guibg=#004443 guifg=#C0FFFF gui=none
hi StatusLineNC guibg=#067C7B guifg=#004443 gui=bold
hi Title        guifg=#8DB8C3
hi Visual gui=bold guifg=black guibg=#C0FFC0
hi WarningMsg   guifg=#F60000 gui=underline

" syntax highlighting groups
"hi Comment guifg=#E7A663
hi Comment guifg=#FFFF33

hi Constant guifg=#00E3C7 gui=bold
hi String guifg=#FFB283 gui=bold
hi Character guifg=#F26D6D gui=bold
hi Number guifg=#72A5E4 gui=bold
hi Boolean guifg=#24C6C9 gui=bold
hi Float guifg=#8066FF gui=bold

hi Identifier   guifg=#ADCBF1
hi Function   guifg=#7EFBB9 gui=bold

hi Statement guifg=#FF1F1F gui=bold
hi Conditional guifg=#FF1F1F gui=bold
hi Repeat guifg=#F27821 gui=bold
hi Label guifg=#FF5C26 gui=bold,italic
hi Operator guifg=#FF5C4D gui=bold
hi Keyword guifg=#FF2348 gui=bold
hi Exception guifg=#FF2348 gui=bold

hi PreProc guifg=#D31EFF gui=bold
hi Include guifg=#D31EFF gui=bold
hi Define guifg=#79F2EF gui=bold
hi Macro guifg=#79F2EF gui=bold
hi Precondit guifg=#FF73F7 gui=bold

hi Type guifg=#3DF23D gui=bold
hi StorageClass guifg=#2CD99F gui=bold
hi Structure guifg=#AFE62F gui=bold
hi Typedef guifg=#3DF23D gui=bold

hi Special guifg=#1ECFFF gui=bold
hi SpecialChar guifg=#1ECFFF gui=bold
hi Tag guifg=#1ECFFF gui=bold
hi Delimiter guifg=#1ECFFF gui=bold
hi Debug guifg=#1ECFFF gui=bold

hi Error guibg=#FF0000 guifg=#FFFFFF
hi Ignore       guifg=grey60
hi Todo guibg=#FFBFEA guifg=#000000
hi Pmenu guibg=#FFFEA3 guifg=#1F1F1F
hi PmenuSel guibg=#1F1F1F guifg=#FFFEA3

"vim: ts=4
