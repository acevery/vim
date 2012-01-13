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

"noremap h k
"noremap j h
"noremap k j
" turbo mode
noremap <A-j> 5j
noremap <A-k> 5k
noremap <A-h> 5h
noremap <A-l> 5l

" keymaps to save time
let mapleader = "-"
nnoremap <leader>e :e<space>
nnoremap <leader>tn :tabnew<space>
nnoremap <leader>x :x<return>
nnoremap <leader>q :q!<return>

"oremap gh gk
"oremap gj gh
"oremap gk gj

"oremap zh zk
""zK does not exist
"oremap zj zh
"oremap zJ zH
"oremap zk zj
""zJ does not exist
"noremap z<Space> zl
"noremap z<S-Space> zL
"oremap zj zh
"oremap zJ zH

"oremap <C-w>h <C-w>k
"oremap <C-w>H <C-w>K
"oremap <C-w>j <C-w>h
"oremap <C-w>J <C-w>H
"oremap <C-w>k <C-w>j
"oremap <C-w>K <C-w>J
"noremap <C-w><Space> <C-w>l
"noremap <C-w><S-Space> <C-w>L
"noremap <C-w><S-BS> <C-w>Hnoremap e d
" ========================================
" formatoption for multibyte characters
"set formatoptions+=nmB

" use tidy to reformat xml and xhtml
vnoremap ,x :!tidy -q -w -i -xml --indent-spaces 4 -utf8<CR>
vnoremap ,h :!tidy -q -w -i -asxhtml --doctype omit --show-body-only yes --show-warnings no --indent-spaces 4 -utf8<CR>

set fileformats=unix,dos,mac
" display line number
set nu

set grepprg=grep\ -nH\ $*

set winaltkeys=no

" file encode part
set fencs=ucs-bom,utf-8,gb18030,big5,default
"set fencs=utf-8,gb18030,iso-8859-1,default
"set fenc=gb18030
set enc=utf-8
set tenc=utf-8

" make non-ascii charaters, excluding Chinese characters, to be displaied in
" single width
set ambiwidth=single
"set lbr

set shiftwidth=4
set softtabstop=4
set tabstop=4
" convert \t to \s * shiftwidth
set expandtab
set tw=80
" do not make linebreak in snippet files
autocmd FileType snippet set tw=0

" do not join space, which means only insert one space after '.', '!', '?'
" during join operation
set nojs
"set fo+=anw
set modeline

"wrap the words, and only in break point
set nolinebreak

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" always recognize .tex by suffix:
let g:tex_flavor = "latex"

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
nnoremap <silent> <F12> :WMToggle<CR>
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

" for 256 color
"set t_Co=256

"colo inkpot

let g:html_indent_strict=1
let g:html_indent_tags="li"

" open javascript fold
let b:javascript_fold=1
" javascript syntax highlight for dom, html, and css
let javascript_enable_domhtmlcss=1
" for po plugin
let g:po_translator="Yuwei Yu <acevery@gmail.com>"
let g:po_lang_team="Simplified Chinese"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype detect diy
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala            setfiletype vala
au BufRead,BufNewFile *.vapi            setfiletype vala
"au BufRead,BufNewFile * if &ft == 'htmldjango' | set ft=htmldjango.xhtml | endif
au BufRead,BufNewFile * if &ft == 'php' | set ft=php.xhtml | endif
" hightlight stuffs
let c_space_errors=1
let python_highlight_all=1
au BufRead,BufNewFile *.smali set filetype=smali
" python dict
autocmd FileType python set dictionary=~/.vim/dict/python.dict

" jquery syntax highlight and snippets
autocmd BufRead,BufNewFile *.js set ft=javascript.jquery
" javascript dict
autocmd FileType javascript set dictionary=~/.vim/dict/javascript.dict
" javascriptlint
autocmd FileType javascript set makeprg=jsl\ -nologo\ -nofilelisting\ -nosummary\ -nocontext\ -conf\ '/etc/jsl.conf'\ -process\ %
autocmd FileType javascript set errorformat=%f(%l):\ %m
autocmd FileType javascript inoremap <silent> <F9> <C-O>:make<CR>
autocmd FileType javascript nnoremap <silent> <F9> :make<CR>
" set indent to 2 in xml
autocmd FileType xml set sw=2 sts=2 et

" =============================================================================
" auto completion
" =================
" css
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
"python autocomplete
autocmd FileType python setlocal omnifunc=pysmell#Complete
" use pythonTidy.py to format code
autocmd FileType python vnoremap <F5> :!pytidy<CR>
" adding comments, m' set context mark, 
autocmd FileType python nnoremap <buffer> ,c ma0i#<esc>`al
autocmd FileType c nnoremap <buffer> ,c maI/* <esc>A */<esc>`a3l
"autocmd FileType c nnoremap <buffer> <Leader>c ma:s/^\( *\)\(.*\)$/\1\/\* \2 \*\//<esc>`al:noh<cr>
autocmd FileType gitconfig nnoremap <buffer> <Leader>c ma0i#<esc>`al
" for easy heading
autocmd FileType rst let @h = "yypVr"

" disable eclim validation in python file saving
let g:EclimPythonValidate=0
let g:EclimXmlValidate=0
" hide eclim completion preview
set completeopt=menu
