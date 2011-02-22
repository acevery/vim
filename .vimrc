filetype plugin on
filetype indent on
" Remapping for Colemak
" ----------------------

" This remaps the movemet keys j and k (In Colemak, J (= Qwerty Y) is placed 
" above K (= Qwerty N), which I find confusing in Vim since j moves down and k 
" up. I think the remappings below result in a more logical and easier to 
" reach layout, keeping in mind that space and backspace (= Qwerty Caps-Lock) 
" can be used instead of Colemak J (= Qwerty Y). I use the join-lines command 
" much more than the help command, and have therefore swapped J and K since I 
" find Colemak K (Qwerty N) much easier to reach than Colemak J (Qwerty Y).

" The first five mappings are basically all one needs to remember.

"noremap K J
"noremap J K
"
"noremap h k
"noremap j h
"noremap k j
"
"noremap gh gk
"noremap gj gh
"noremap gk gj
"
"noremap zh zk
""zK does not exist
"noremap zj zh
"noremap zJ zH
"noremap zk zj
""zJ does not exist
"noremap z<Space> zl
"noremap z<S-Space> zL
"noremap z<BS> zh
"noremap z<S-BS> zH
"
"noremap <C-w>h <C-w>k
"noremap <C-w>H <C-w>K
"noremap <C-w>j <C-w>h
"noremap <C-w>J <C-w>H
"noremap <C-w>k <C-w>j
"noremap <C-w>K <C-w>J
"noremap <C-w><Space> <C-w>l
"noremap <C-w><S-Space> <C-w>L
noremap <C-w><S-BS> <C-w>Hnoremap e d
set fileformats=unix,dos,mac
" always recognize .tex by suffix:
let g:tex_flavor = "latex"
set nu
set grepprg=grep\ -nH\ $*
set winaltkeys=no
"set fencs=ucs-bom,utf-8,gb18030,big5,default
set fencs=ucs-bom,utf-8,gb18030,big5,iso-8859-1,default
"set fenc=gb18030
set enc=utf-8
set tenc=utf-8
set ambiwidth=single
"set linebreak
"set lbr
set shiftwidth=4
set softtabstop=4
set tw=80
set tabstop=4
" convert \t to \s * shiftwidth
set expandtab
" do not join space, which means only insert one space after '.', '!', '?'
" during join operation
set nojs
"set fo+=anw
set modeline

"wrap the words, and only in break point
set linebreak

"the follow lines are for beamer-package support in latex-suite
let g:Tex_FoldedEnvironments="verbatim,comment,eq,subeq,gather,align,math,displaymath,tikzpicture,figure,table,thebibliography,column,keywords,abstract,titlepage,frame"
let g:Tex_Env_frame= "\\begin{frame}<+[options]+>\<cr>\\frametitle{<+title+>}\<cr><++>\<cr>\\end{frame}\<cr><++>"
let g:Tex_Env_definition="\\begin{definition}\<<+action specification+>\>[<+addition text+>]\<cr><++>\<cr>\\end{definition}\<cr><++>"
let g:Tex_Env_column="\\begin{column}{<+width+>}\<cr><++>\<cr>\\end{column}<++>"
let g:Tex_Env_columns="\\begin{columns}<+[align pos]+>\<cr><++>\<cr>\\end{columns}<++>"
let g:Tex_Env_block="\\begin{block}{<+title+>}\<cr><++>\<cr>\\end{block}<++>"
"the follow lines are for pdf package support in latex-suite
let g:Tex_Env_tikzpicture="\\begin{tikzpicture}[<+styles+>]\<cr>\\draw<++>\<CR>\<cr>\\end{tikzpicture}<++>"
" 

" for taglist-plugins
"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
nnoremap <silent> <F8> :TlistToggle<CR>
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap <silent> <F12> :WMToggle<CR>
" make :Man command avaliable
source $VIMRUNTIME/ftplugin/man.vim
" Default MANPAGER vimmanpager doesn't play well
" with the :Man command and we don't want to see raw colour codes
" so we use sed to strip them.
let $MANPAGER = "sed -e 's:\\x1B\\[[[:digit:]]\\+m::g'"
" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"    \| exe "normal g'\"" | endif
"endif
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview
"

" for 256 color
"set t_Co=256

"colo inkpot

let g:html_indent_strict=1
let g:html_indent_tags="li"
" filetype detect diy
autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala            setfiletype vala
au BufRead,BufNewFile *.vapi            setfiletype vala
"au BufRead,BufNewFile * if &ft == 'htmldjango' | set ft=htmldjango.xhtml | endif
" for po plugin
let g:po_translator="Yuwei Yu <acevery@gmail.com>"
let g:po_lang_team="Simplified Chinese"
" hightlight stuffs
let c_space_errors=1
let python_highlight_all=1
