" source xx/xx/vimrc

"if exists("g:load_change_color_scheme")
"    finish
"endif
"let g:load_change_color_scheme = 1
"nnoremap mm :colors  
"nnoremap mn :vsp ~/documents/git/git.md


" son version can use this configuration
" fix bug for vi
set nocompatible

" check file type automaticly
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
" such as ( ... )
set showmatch
" cursor status in riht corner
set ruler

" can use mouse in vim
set mouse=a

" bottom status
set laststatus=1

" execute oder in current dir
set autochdir

" encoding
set encoding=utf-8

" :let html_my_rendering=1
" :let mysql_sql_query=1
" "let g:is_bash =1

" when open file go to pre position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" line number on left
set number
" set nonumber

" line relative number on left
set relativenumber
"set norelativenumber

" no set independent vim clipboard
" press ctrl+shirt and use mouse to select, then use ctrl+shirt+c to copy
set clipboard=unnamed

""cursor position up from bottom
set scrolloff=5

""code hight light
syntax enable
syntax on

" in : get tip by table key
set wildmenu

" hight light search result
"set hlsearch
set nohlsearch

" hight light when search
set noincsearch

" ignore case when search
set noignorecase

" smart case when search
set nosmartcase

" show line of current line
set nocursorline

" set vim color
color note_code

" display automaticly 
set wrap

" <CR> automaticly
set textwidth=999

" show cmd
set showcmd

" when split, make cursor on right
"set splitright
set nosplitright

" when split, make cursor on below
set splitbelow
"set nosplitbelow

" ============
" basic map
" ============
" enter in normal model
nnoremap <CR> o<Esc>
"inoremap <S-CR> i<CR><Esc>
":autocmd CmdwinEnter * nnoremap <CR> <CR>
":autocmd BufReadPost quickfix nnoremap <CR> <CR>
inoremap <s-tab> <c-x><c-f>

" ================
" match vimium
" ================
"unmap H
"unmap L
" -> decrease line
nnoremap <c-w>j J
" -> man <command>
nnoremap <c-w>k K
" move cursor to other window in vim
nnoremap H <c-w>h
nnoremap L <c-w>l
nnoremap J <c-w>j
nnoremap K <c-w>k
" move window in vim
nnoremap <c-s>h <c-w>H
nnoremap <c-s>l <c-w>L
nnoremap <c-s>j <c-w>J
nnoremap <c-s>k <c-w>K
" gg -> left
nnoremap [ <c-w><
"nunmap [[
" G -> right
nnoremap ] <c-w>>
"nunmap ]]
" down -> high
"nunmap +
nnoremap + <c-w>+
" up -> low
"nunmap -
nnoremap - <c-w>-
" <<+^ -> AAA
"nunmap =
nnoremap = <c-w>=

" ====================
" command in terminal
" ===================
" translate
nnoremap tl :!yd 

" ===================
" unmap
" ====================



" =====================
" appearance for cursor
" =====================
" cursor size Settings
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
" Cursor settings:
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"


" esec ""


" =================
" vim plug manager
" =================
" vimawesome.com

" curl ....

"call plug#begin('<path>')
"
"Plug 'scrooloose/nerdtree'
"Plug 'coc'
"Plug 'iamcco/markdown-preview.nvim'
"Plug 'ale'
"Plug 'vim-table-mode'
"Plug 'vim-signiture'
"Plug 'hte nerd tree'
"Plug ''
"
"call plug#end()

" PlugInstall


"-------------------------------


" ===========
" MarkDown
" ===========
" massage document: github:Markdown-here

" tips: markdown,*.txt
" inoremap insert mode
" noremap normal mode and no recursion(j=5j)
if has ("autocmd")

" <Enter> by oderly
autocmd Filetype markdown set autoindent
autocmd Filetype markdown set smartindent

" spelling check
autocmd Filetype markdown set spell

" jump
autocmd Filetype markdown inoremap ,f <Esc>/口口口<CR>:nohlsearch<CR>c3l
"autocmd Filetype markdown inoremap <s-CR> <Esc>A<CR>
"autocmd Filetype markdown inoremap <CR> <Esc>/口口口<Enter>c3l


" title
" H1 ; other use: ===
autocmd Filetype markdown inoremap ,1 #<Space>
" H2 ; other use: ---
autocmd Filetype markdown inoremap ,2 ##<Space>2<Space>
autocmd Filetype markdown inoremap ,3 ###<Space>3<Space><Space>
autocmd Filetype markdown inoremap ,4 ####<Space>4<Space><Space><Space>
autocmd Filetype markdown inoremap ,5 #####<Space>5<Space><Space><Space><Space>
autocmd Filetype markdown inoremap ,6 ######<Space>6<Space><Space><Space><Space><Space>

" enters
autocmd Filetype markdown inoremap ,n <Enter><Enter><Enter>

" B ; other use: ____
autocmd Filetype markdown inoremap ,b ****<Space>口口口<Esc>F*hi
" ---
autocmd Filetype markdown inoremap ,s ~~~~<Space>口口口<Esc>F~hi
" / ; other use:  __
autocmd Filetype markdown inoremap ,i __<Space>口口口<Esc>F_i

" list
" other use: <number>.<Space>
" other use: -<Space>
" other use: +<Space>
"autocmd Filetype markdown inoremap ,100 *<Space>口口口

" links use: [xxx](link)
" other use: [xxx][case-insensitice symbol]	[case-insensitice symbol]: here write link
" other use: [ABC]	[ABC]: here write link
" other use: http://...
" other use: <...>
autocmd Filetype markdown inoremap ,a [](口口口) 口口口<Esc>F[a

" image use: ![alt text](link "display")
" other use: ![alt text][symbol]		[symbol]: link "display"
"autocmd Filetype markdown inoremap ,p ![](口口口<Space>"口口口") 口口口<Esc>F[a

" hightlight
autocmd Filetype markdown inoremap ,d `` 口口口<Esc>F`i

" code use: ```language
"		...
"	   ```
"autocmd Filetype markdown inoremap ,c ```<Enter>```<Enter><Enter>口口口<Esc>3kA
autocmd Filetype markdown inoremap ,ce ```<Enter>```<Enter><Enter>口口口<Esc>3kA
autocmd Filetype markdown inoremap ,cs ```shell<Enter><Enter>```<Enter><Enter>口口口<Esc>3kA
autocmd Filetype markdown inoremap ,cj ```javascript<Enter><Enter>```<Enter><Enter>口口口<Esc>3kA
autocmd Filetype markdown inoremap ,cc ```c<Enter><Enter>```<Enter><Enter>口口口<Esc>3kA
autocmd Filetype markdown inoremap ,cg ```go<Enter><Enter>```<Enter><Enter>口口口<Esc>3kA

" tables use:
" xxx | xxx | xxx
" --- | --- | ---
" yyy | yyy | yyy
" we can write : to side of '-' to right-aligned or centered
" -: right	:- left		:-:	center
"autocmd Filetype markdown inoremap ,4224 口口口<Space>|<Space>口口口<Space>|<Space>口口口<Enter>---<Space>|<Space>---<Space>|<Space>---<Enter>口口口<Space>|<Space>口口口<Space>|<Space>口口口

" blockquotes
" I
" I
" I
" higher use: >><Space>
"autocmd Filetype markdown inoremap ,12313 ><Space> 口口口

" we can use HTML grammer
" <dl>
"   <dt>Definition list</dt>
"   <dd>Is something people use sometimes.</dd>
" </dl>

" ---------------------
" use: ---
" other use: ***
" other use: ___
autocmd Filetype markdown inoremap ,l <Enter><Enter><Enter><Enter>--------------------------------<Enter><Enter><Enter><Enter><Enter>

" some else function: YouTube video	math

" need use '\' to desplay
" ` _ {} [] () # + - * . !

" view
"nmap <F4> :call PreviewMarkdown()<CR>
func! PreviewMarkdown()
	if &filetype == 'markdown' || $filetype == 'md'
		exec "!typora %"
	endif
endfunc


endif
