" ================================
" === configuration of vim
" === suit for go and markdown
" === author : keysquivered
" ================================

"source xx/xx/vimrc
"let g:load_change_color_scheme = 1
"if exists("g:load_change_color_scheme")
"    finish
"endif
"autocmd BufReadPost $MYVIMRC source $MYVIMRC

" son version can use this configuration
" fix bug for vi
set nocompatible

" check file type automaticly
filetype on
filetype indent on

" such as ( ... )
set showmatch

" cursor status in riht corner
"set ruler

" display by 2character
"set ambiwidth=double

" can use mouse in vim
"set mouse=a

" bottom status
" 0 : not display; 1 : display When one window; 2 : always display
" show status : ctrl + g | :f
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
" %F 完整文件路径名
" %m 当前缓冲被修改标记
" %m 当前缓冲只读标记
" %h 帮助缓冲标记
" %w 预览缓冲标记
" %Y 文件类型
" %b ASCII值
" %B 十六进制值
" %l 行数
" %v 列数
" %p 当前行数占总行数的的百分比
" %L 总行数
" %{...} 评估表达式的值，并用值代替
" %{"[fenc=".(&fenc==""?&enc:&fenc).((exists("+bomb") && &bomb)?"+":"")."]"} 显示文件编码
" %{&ff} 显示文件类型
"set statusline=%F%m%r%h%w%=\ [ft=%Y]\ %{\"[fenc=\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"]\"}\ [ff=%{&ff}]\ [asc=%03.3b]\ [hex=%02.2B]\ [pos=%04l,%04v][%p%%]\ [len=%L]
"%(...%)	定义一个项目组。
"%{n}*	%对其余的行使用高亮显示组Usern，直到另一个%n*。数字n必须从1到9。用%*或%0*可以恢复正常的高亮显示。
"%<	如果状态行过长，在何处换行。缺省是在开头。
"%=	左对齐和右对齐项目之间的分割点。
"%%	字符%
"%B	光标下字符的十六进制形式
"%F	缓冲区的文件完整路径
"%H	如果为帮助缓冲区则显示为HLP
"%L	缓冲区中的行数
"%M	如果缓冲区修改过则显示为+
"%N	打印机页号
"%O	以十六进制方式显示文件中的字符偏移
"%P	文件中光标前的%
"%R	如果缓冲区只读则为RO
"%V	列数。如果与%c相同则为空字符串
"%W	如果窗口为预览窗口则为PRV
"%Y	缓冲区的文件类型，如vim
"%a	如果编辑多行文本，这个字行串就是({current} of {arguments})，例如：(5 of 18)。如果在命令行中只有一行，这个字符串为空
"%b	光标下的字符的十进制表示形式
"%c	列号
"%f	缓冲区的文件路径
"%h	如果为帮助缓冲区显示为[Help]
"%l	行号
"%m	如果缓冲区已修改则表示为[+]
"%n	缓冲区号
"%o	在光标前的字符数（包括光标下的字符）
"%p	文件中所在行的百分比
"%r	如果缓冲区为只读则表示为[RO]
"%t	文件名(无路径)
"%v	虚列号
"%w	如果为预览窗口则显示为[Preview]
"%y	缓冲区的文件类型，如[vim]
"%{expr}	表达式的结果
"
"function! GitBranch()
  "return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
"endfunction
"
"function! StatuslineGit()
  "let l:branchname = GitBranch()
  "return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
"endfunction
"
"set statusline=
"set statusline+=%#PmenuSel#
"set statusline+=%{StatuslineGit()}
"set statusline+=%#LineNr#
"set statusline+=\ %f
"set statusline+=%m\
"set statusline+=%=
"set statusline+=%#CursorColumn#
"set statusline+=\ %y
"set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
"set statusline+=\[%{&fileformat}\]
"set statusline+=\ %p%%
"set statusline+=\ %l:%c
"set statusline+=\
set laststatus=2
set statusline=
set statusline+=%#LineNr#\ %1*%r\ %M\ %6*===\ %4*%f\ %3*%l%4*-%3*%v\ %6*===
set statusline+=\ %=
set statusline+=\ %4*%F\ %5*%Y\ %2*%{&fileencoding?&fileencoding:&encoding}\ %3*%p%%

" execute oder in current dir
set autochdir

" encoding
set encoding=utf-8

" when open file go to pre position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" line number on left
set number
" line relative number on left
set relativenumber

" no set independent vim clipboard
" press ctrl+shirt and use mouse to select, then use ctrl+shirt+c to copy
set clipboard=unnamed

" cursor position up from bottom
set scrolloff=5

" in : get tip by table key
set wildmenu

" hight light search result
set nohlsearch
" hight light when search
set noincsearch
" ignore case when search
set noignorecase
" smart case when search
set nosmartcase

" show line of current line
set nocursorline

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

" table
set tabstop=4
" lenght of -> for all level
set shiftwidth=4

" set count of "yy"
set viminfo='1000,<1000





" ================================
" ===basic map
" ================================
"let mapleader = "\"
" enter in normal model
nnoremap <CR> o<Esc>
"inoremap <S-CR> i<CR><Esc>
":autocmd CmdwinEnter * nnoremap <CR> <CR>
":autocmd BufReadPost quickfix nnoremap <CR> <CR>
inoremap <s-tab> <c-x><c-f>
" space in normal model
"nnoremap <space> i <Esc>
" bottom information
nnoremap <C-g> 1<c-g>
" return to last place and view in middle
"nnoremap <C-o> <c-g>zz
" return to new place and view in middle
"nnoremap <C-i> <c-g>zz





" ================================
" match vimium
" ================================
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





" ================================
" ===appearance for cursor
" ================================
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





" ================================
" ===markdown
" ================================
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





" ================================
" ===ranger
" ================================
" let g:ranger_map_keys = 0





" ================================
" ===function
" ================================
" Compile function
if has ("autocmd")
	autocmd Filetype go nnoremap go :call CompileRunGcc()<CR><c-w>h
	"autocmd Filetype go nnoremap gO <c-w>l:close<CR>
	"autocmd Filetype go nnoremap gn :cnext<CR>
	"autocmd Filetype go nnoremap gN :cprevious<CR>
	"autocmd Filetype go nnoremap gc :cclose<CR>
	"autocmd Filetype go nnoremap gb :GoBuild<CR>
	"autocmd Filetype go nnoremap gt :GoTest<CR>
	"autocmd Filetype go nnoremap gt :GoRename<CR>
endif
func! CompileRunGcc()
	exec "w"
	"exec "2close"
	exec "only"
	if &filetype == 'go'
		" run current file
		:GoRun %
		":rightbelow vert term ++cols=40 go run .
		":term go run .
	elseif &filetype == 'sh'
		":!time bash %
	elseif &filetype == 'html'
		"silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		"exec "InstantMarkdownPreview"
	elseif &filetype == 'javascript'
		"set splitbelow
		":sp
		":term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	endif
endfunc





" ================================
" ===plug manager
" ================================
" more plug search : vimawesome.com
filetype plugin on
filetype plugin indent on
call plug#begin('~/.vim/plugged')
"Plug 'fatih/molokai'
Plug 'keysquivered/vim-go-markdown-colors'
Plug 'fatih/vim-go', {'for':'go'}
"Plug 'dense-analysis/ale'
" need install nodejs npm yarn
Plug 'neoclide/coc.nvim', {'for':['go','vim'], 'branch':'release'}
Plug 'jiangmiao/auto-pairs', {'for':['go','vim','markdown','json']}
Plug 'ctrlpvim/ctrlp.vim', {'for':'go'}
"Plug 'junegunn/fzf.vim'
"Plug 'junegunn/fzf'
"Plug 'ianva/vim-youdao-translater'
"Plug 'scrooloose/nerdtree', {'for':'go'}
Plug 'SirVer/ultisnips', {'for':'go'}
Plug 'buoto/gotests-vim', {'for':'go'}
"Plug 'tenfyzhong/gengotag', {'do': 'go build'}
" need cd directory and go build
Plug 'tenfyzhong/gengotag', {'for': 'go'}
"Plug 'preservim/nerdcommenter', {'for':['go','vim']}
"Plug 'honza/vim-snippets', {'for':'go'}
"Plug 'godlygeek/tabular'
"Plug 'scrooloose/nerdtree' , {'on': 'NERDTreeToggle'}
"Plug 'iamcco/markdown-preview.nvim'
"Plug 'vim-table-mode'
"Plug 'vim-signiture'
call plug#end()
" PlugInstall
function! UpdateMyAllPlugins()
	exec "PlugUpgrade"
	exec "PlugUpdate"
	exec "GoUpdateBinaries"
endfunction





" ================================
" ===colors
" ================================
"code hight light
syntax enable
syntax on
" :so $VIMRUNTIME/syntax/hitest.vim
color vim-go-markdown-colors
" molokai
"let g:rehash256 = 1
"let g:molokai_original = 1
"colorscheme molokai






" ================================
" ===ultisnips
" ================================
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger=",e"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger=",f"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsJumpBackwardTrigger=",F"
"let g:UltiSnipsSnippetDirectories =['','']

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"





" ================================
" ===vim-go===
" ================================
"autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd Filetype go nmap <space>gc :GoRename<space>

autocmd Filetype go nmap <silent> <space>ga :GoAlternate<CR>

" go to definition use guru but it may slow
"let g:go_def_mode = 'godef'
autocmd Filetype go nmap <silent> <space>gd :GoDef<CR>
autocmd Filetype go nmap <silent> <space>gb :GoDefPop<CR>
"nmap <silent> <space>gs :GoDefStack<CR>
"
autocmd Filetype go nmap <space>gi :GoImpl<space>

"let g:go_fillstruct_mode = 'fillstruct'
let g:go_fillstruct_mode = 'gopls'
autocmd Filetype go nmap <silent> <space>gs :GoFillStruct<CR>

autocmd Filetype go nmap <silent> <space>gv :GoSameIdsAutoToggle<CR>

" show funciton struct
"let g:go_decls_includes = "func,type"
autocmd Filetype go nmap <silent> <space>gf :GoDecls<CR>
autocmd Filetype go nmap <silent> <space>gF :GoDeclsDir<CR>

" Possible options are: `snakecase`(_), `camelcase`(aBc), `lispcase`, `pascalcase`, `keep`
autocmd Filetype go nmap <space>gt :GoAddTags<space>
let g:go_addtags_transform = 'camelcase'

"dif, daf...
" jump to error
":cnext
":cprevious
":cclose

"let g:go_list_type = "quickfix"

" debug window
let g:go_debug_windows = {
		\ 'vars':       'leftabove 40vnew',
		\ 'stack':      'botright 3new',
	  \ }
		"\ 'goroutines': 'botright 3new',
		"\ 'out':        'botright 5new',
" debug key mapping
let g:go_debug_breakpoint_sign_text = '='
let g:go_debug_mappings = {
	     \ '(go-debug-print)':      {'key': '<F3>'},
	     \ '(go-debug-breakpoint)': {'key': '<F4>'},
	     \ '(go-debug-continue)':   {'key': '<F5>'},
	     \ '(go-debug-next)':       {'key': '<F6>'},
	     \ '(go-debug-step)':       {'key': '<F7>'},
	     \ '(go-debug-stepout)':    {'key': '<F8>'},
	     \ '(go-debug-halt)':       {'key': '<F10>'},
	     \ '(go-debug-restart)':    {'key': '<F11>'},
	     \ '(go-debug-stop)':       {'key': '<F12>'},
	  \ }

"show type of function , variate
let g:go_auto_type_info = 1

" update time
let g:go_updatetime = 100

" hilight for same variate
"let g:go_auto_sameids = 0
"
" inside terminal
let g:go_term_enabled = 1
let g:go_term_width = 40
"let g:go_term_height = 5
let g:go_term_mode = "rightbelow vsplit"

" do after save 
"let g:go_fmt_autosave = 1
"let g:go_imports_autosave = 1
"let g:go_mod_fmt_autosave = 1
"let g:go_asmfmt_autosave = 0
"let g:go_template_autocreate = 1
"let g:go_fmt_command = "goimports"

let g:go_metalinter_autosave = 1
"let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_command = "gopls"
"let g:go_metalinter_deadline = "5s"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let	g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_operators = 1
let g:go_highlight_variable_declarations = 1
" build flag on head of file
"let g:go_highlight_build_constraints = 1
" hightlight generate text
"let g:go_highlight_generate_tags = 1

"let g:go_highlight_structs = 1
"let g:go_highlight_extra_types = 1


"let g:go_highlight_array_whitespace_error = 1
"let g:go_highlight_chan_whitespace_error = 1
"let g:go_highlight_format_strings = 0
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 0
"let g:go_highlight_space_tab_error = 1
"let g:go_highlight_string_spellcheck = 1
"let g:go_highlight_trailing_whitespace_error = 1
"let g:go_highlight_variable_assignments = 1
"let g:go_doc_keywordprg_enabled = 





" ================================
" ===coc
" ================================
" :h coc-variable
"let g:coc_node_path =

" automaticly install extensions when open vim
"let g:coc_global_extensions = ['coc-snippets', 'coc-translator']
"let g:coc_global_extensions = ['coc-snippets']
"imap ,e <Plug>(coc-snippets-expand)

" TextEdit might fail if hidden is not set.
"set hidden

" Some servers have issues with backup files, see #649.
"set nobackup
"set nowritebackup

" Give more space for displaying messages.
"set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" number of line and sign in same column
if has("nvim-0.5.0") || has("patch-8.1.1564")
	" Recently vim can merge signcolumn and number column into one
	set signcolumn=number
else
	set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
autocmd Filetype go,vim inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
autocmd Filetype go,vim inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"return !col || getline('.')[col - 1]  =~ '\s'

" Use <c-space> to trigger completion.
" call complement
if has('nvim')
	autocmd Filetype go,vim inoremap <silent><expr> <c-space> coc#refresh()
else
	autocmd Filetype go,vim inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
	"\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" swtich next error
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
autocmd Filetype go,vim nmap <silent> <space>gN <Plug>(coc-diagnostic-prev)
autocmd Filetype go,vim nmap <silent> <space>gn <Plug>(coc-diagnostic-next)

" GoTo code navigation.
" go to define and show path of file
"autocmd Filetype go,vim nmap <silent> <space>gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
" go to place of use
autocmd Filetype go,vim nmap <silent> <space>gu <Plug>(coc-references)
autocmd Filetype go,vim nmap <silent> <space>gl <plug>(coc-openlink)
"nmap <silent> <space>gc <plug>(coc-rename)

" call help
autocmd Filetype go,vim nnoremap <silent> <space>gh :call CocActionAsync('doHover')<cr>

" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"function! s:show_documentation()
	"if (index(['vim','help'], &filetype) >= 0)
		"execute 'h '.expand('<cword>')
	"elseif (coc#rpc#ready())
		"call CocActionAsync('doHover')
	"else
		"execute '!' . &keywordprg . " " . expand('<cword>')
	"endif
"endfunction

" Highlight the symbol and its references when holding the cursor.
"autocmd FileType go autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

"augroup mygroup
	"autocmd!
	"" Setup formatexpr specified filetype(s).
	"autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	"" Update signature help on jump placeholder.
	"autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)
"xmap ic <Plug>(coc-classobj-i)
"omap ic <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
"if has('nvim-0.4.0') || has('patch-8.2.0750')
	"nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	"nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	"inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
	"inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
	"vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	"vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)
"
" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
let g:coc_default_semantic_highlight_groups = 1





" ================================
" ===auto-pairs
" ================================
let g:AutoPairsShortcutFastWrap = '<c-e>'





" ================================
" ===nerdtree
" ================================
" Exit Vim if NERDTree is the only window remaining in the only tab.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let g:NERDTreeWinSize = 15





" ================================
" ===gotests
" ================================
let g:gotests_bin = '/home/zombie/go/bin/gotests'
