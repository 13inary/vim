" ================================
" === configuration of vim
" === suit for go and markdown
" === author : gvls
" === use : sudo echo 'source ~/.vim/vimConfig.vim' >> /usr/share/vim/vimrc
" ================================

" ================================
" === basic setting
" ================================
set nocompatible " not suit 'vi' and get more fuction
filetype plugin indent on " 为特定文件使用插件 为特定文件类型使用缩进 开启检测文件类型。获取文件类型：&filetype == 'vim'
set showmatch " such as ( ... )
set showtabline=1 " show tab line
set noruler " cursor status in riht corner
"set ambiwidth=double " display by 2character
set autochdir " execute oder in current dir
" encoding of display
" in addition, :e ++enc=cp936 || :e ++enc=euc-cn
set encoding=utf-8
" encoding of save file
"set fileencoding=utf-8
" encoding list which display according to
"set fileencodings=utf8,ucs-bom,default,latin1,gbk,cp936,gb2312,gb18030
"set fileformat=unix
" when open file go to pre position
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set signcolumn=yes " Vim 7.4.2201
"set number " line number on left
"set relativenumber " line relative number on left
"set clipboard=unnamed " press ctrl+shirt and use mouse to select, then use ctrl+shirt+c to copy
set scrolloff=5 " 光标距离顶部和底部的最短距离
set wildmenu " in : get tip by table key
set nohlsearch " 不高亮查找结果
set noincsearch " hight light when search
set ignorecase " 查找忽略大小写
set nosmartcase " smart case when search
"set nocursorline " 显示光标所在的行
set wrap " display automaticly 
set textwidth=999 " 'Enter' automaticly
set showcmd " show cmd
set nosplitright " 分屏时光标在左边
set splitbelow " 分屏时光标在下面
set tabstop=4 " Tab键缩进的长度
if &filetype != "go"
    set expandtab " 缩进使用空格，noexpandtab使用制表符
    set softtabstop=4 " 编辑模式下backspace的长度
    ":%retab 修改文件的制表符为空格
endif
"set autoindent " 自动缩进
"set cindent " 自动缩进补充
set shiftwidth=4 " lenght of -> for all level 自动缩进空白字符数
set viminfo='1000,<100 " 'yy'的最大行数





" ================================
" === bottom setting
" ================================
" === 状态行 ===
"%<	如果状态行过长，在何处换行。缺省是在开头。
set statusline=
set statusline+=%#LineNr#\ %1*%r%M\ %7*[%4*%l%7*-%4*%v%7*]
"set statusline+=\ %4*%{StatuslineGit()}
set statusline+=\ %4*-%8*%{GitStatusA()}%4*-%6*%{GitStatusM()}%4*-%1*%{GitStatusR()}%4*-
set statusline+=\ %1*%{coc#status()}
set statusline+=\ %=
set statusline+=\ %4*%L\ %7*%Y\ %2*%{&fileencoding?&fileencoding:&encoding}\ %3*%p%%
"fun! GitBranch()
	"return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
"endfun
"fun! StatuslineGit()
	"let l:branchname = GitBranch()
	"return strlen(l:branchname) > 0?' '.l:branchname.'':' '
"endfun
" === 状态信息 ===
" 0 : not display; 1 : display When one window; 2 : always display
" show status : ctrl + g | :f
set laststatus=2





" ================================
" === key map
" ================================
"let mapleader = "\"
"nnoremap <CR> o<Esc>
"inoremap <S-CR> i<CR><Esc>
"inoremap <s-tab> <c-x><c-f>
" 在底部信息栏显示文件路径
nnoremap <C-g> 1<c-g>





" ================================
" ===appearance of cursor
" ================================
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[3 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
" 1 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
" 5 -> blinking vertical bar
" 6 -> solid vertical bar





" ================================
" === exe file
" ================================
autocmd Filetype go,sh nnoremap <silent> go :call MyCompileRunGccMy()<CR><c-w>h
func! MyCompileRunGccMy()
	exec "w"
	" 关闭执行终端
	"exec "2close"
	"exec "only"
	let l:currentBufName = bufname("%")
	let l:goTermWinName = "!go run ".currentBufName
	let l:ifGoTerm = bufexists(goTermWinName)
	if ifGoTerm == 1
		let l:bufN = bufnr(goTermWinName)
		exec ":bdelete ".bufN
		return
	endif
	let l:shTermWinName = "!bash ".currentBufName
	let l:ifShTerm = bufexists(shTermWinName)
	if ifShTerm == 1
		let l:bufN = bufnr(shTermWinName)
		exec ":bdelete ".bufN
		return
	endif

	" 执行当前文件
	if &filetype == 'go'
"		:GoRun %
		:rightbelow vert term ++cols=40 go run %
		":term go run .
	elseif &filetype == 'sh'
		":!bash %
		:rightbelow vert term ++cols=50 bash %
	endif
endfunc





" ================================
" === close all when exit
" ================================
augroup myAutoExitGroupMy
	autocmd!
	autocmd bufenter * silent call MyAutoExitWinMy()
augroup END
func! MyAutoExitWinMy()
	let l:currentBufName = bufname("%")
	let l:currentWinN = winnr()
	let l:ifGoTerm = matchstr(currentBufName, "^!go run .*\.go")
	let l:ifSh = matchstr(currentBufName, "^!bash .*\.sh")
	let l:firstWinBuf = winbufnr(1)
	"echom ifSh
	if ifGoTerm != "" && currentWinN == 1
		exe "q"
	endif
	"if currentBufName == "" && currentWinN == 1 && firstWinBuf > 1
	" parameter 2 : avoid open other window appear exit
	if currentBufName == "" && currentWinN == 1
		exe "q"
	endif
	if ifSh != "" && currentWinN == 1
		exe "q"
	endif
endfun





" ================================
" === init file when create new file
" ================================
" au[tocmd] [group] {event} {pat} [nested] {cmd}
" BufEnter : may tell you file is changed
augroup myInitNewFileGroupMy
	" clear old command of myInitNewFile
	autocmd!
	" do what you want
	autocmd BufNewFile *.go,*.sh,*.proto,*.md silent call MyInitNewFileFucMy()
	"autocmd BufNewFile *.go,*.sh 0r ~/vim/skeleton.go
augroup END
fun! MyInitNewFileFucMy()
	" system("InitNewFile.sh", getcwd() bufname("%"))
	:r! /usr/local/vim/InitNewFile `pwd` %
	:%s/^\n//
	:%s/缓缓缓//
	:%s/口口口//
endfun





" ================================
" === add exe for *.sh
" ================================
augroup myExitFileAddXGroupMy
	autocmd!
	autocmd BufWritePost *.sh silent call MyExitFileAddXMy()
augroup END
fun! MyExitFileAddXMy()
	if &filetype == "sh"
		let l:fileName = bufname("%")
		let l:myPerm = getfperm(fileName)
		let l:ifX = matchstr(myPerm, "x")
		if ifX == ""
			call setfperm(fileName,"rwxrwxr-x")
		endif
		":r! chmod +x %
		"let kkkk = system(l:ddd)
	endif
endfun





" ================================
" === copy to system
" ================================
nnoremap <silent> yy yy:call MySystemCopyMy()<CR>
xnoremap <silent> y y:call MySystemCopyMy()<CR>
fun! MySystemCopyMy()
	let l:currentYY = getreg()
	let l:actualYY = strpart(currentYY, 0, strlen(currentYY)-1)
	"let l:escape1 = substitute(actualYY, '\', '\\\','g')
	"let l:escape2 = substitute(escape1, '`', '\\`','g')
	"let l:escape3 = substitute(escape2, "#", "\\\\#",'g')
	"let l:escape4 = substitute(escape3, "%", "\\\\%",'g')
	"let l:escape5 = substitute(escape4, "?", "\\\\?",'g')
	"let l:escape6 = substitute(escape5, "}", "\\\\}",'g')
	"let l:escape7 = substitute(escape6, "[", "\\\\[",'g')
	"let l:escape8 = substitute(escape7, "]", "\\\\]",'g')
	"let l:escape = substitute(escape5, "{", "\\\\{",'g')
	"call system("echo ".shellescape(expand(escape))." | xsel -b")
	call system("echo ".shellescape(actualYY)." | xsel -b")
endfun





" ================================
" === make annotation
" ================================
autocmd Filetype go,sh,proto,vim nmap <silent> <c-h> :call MyDoAnnotationMy()<CR>
fun! MyDoAnnotationMy()
	" //类型
	if &filetype == 'proto' || &filetype == 'go'
		let l:myCurrentText = getline(".")
		let l:myText = matchstr(myCurrentText, '^\t* *//.*')
		if myText == ""
			:execute "normal ^i//\<Esc>j"
		else
			let l:newCurrentText = substitute(myCurrentText, "// *", "","")
			call setline(line("."), newCurrentText)
			:normal j
		endif
		return
	endif

	" #类型
	if &filetype == 'sh'
		let l:myCurrentText = getline(".")
		let l:myText = matchstr(myCurrentText, '^\t* *#.*')
		if myText == ""
			:execute "normal ^i#\<Esc>j"
		else
			let l:newCurrentText = substitute(myCurrentText, "# *", "","")
			call setline(line("."), newCurrentText)
			:normal j
		endif
		return
	endif

	" "类型
	if &filetype == 'vim'
		let l:myCurrentText = getline(".")
		let l:myText = matchstr(myCurrentText, '^\t* *".*')
		if myText == ""
			:execute "normal ^i\"\<Esc>j"
		else
			let l:newCurrentText = substitute(myCurrentText, '" *', "","")
			call setline(line("."), newCurrentText)
			:normal j
		endif
		return
	endif
endfun





" ================================
" === plug manager
" ================================
" more plug search : vimawesome.com
call plug#begin('/usr/local/vim/plugged')
"Plug 'guns/xterm-color-table' " show 255 color
Plug 'gvls/vim-nature-color' " color theme
"Plug 'dense-analysis/ale' " check grammar
Plug 'neoclide/coc.nvim', {'branch':'release'} " need install nodejs npm yarn
Plug 'airblade/vim-gitgutter' " git : show add, change, remove
Plug 'fatih/vim-go', {'for':'go'} " 'do':':GoInstallBinaries' IDE for golang
" honza/vim-snippets: get snippets
"Plug 'L3MON4D3/LuaSnip', {'for':'go'} " be use in nvim and lua
Plug 'SirVer/ultisnips', {'for':['go','c']} " snippets engine
"Plug 'LunarWatcher/auto-pairs'
Plug 'jiangmiao/auto-pairs', {'for':['go','vim','sh','markdown','json','proto','html']} " {} [] () ...
Plug 'tpope/vim-surround' " CUID surround of text
Plug 'vim-scripts/argtextobj.vim', {'for':'go'} " cia dia yia  caa daa yaa
"Plug 'gcmt/wildfire.vim' " auto select text in vitual mode
"Plug 'junegunn/fzf.vim', {'for','go'}
"Plug 'junegunn/fzf', {'for','go'}
Plug 'ctrlpvim/ctrlp.vim', {'for':'go'} " help search text
Plug 'buoto/gotests-vim', {'for':'go'}
Plug 'tenfyzhong/gengotag', {'for': 'go'} " use configuration file generate struct. cd directory and go build
Plug 'dhruvasagar/vim-table-mode', {'for':'markdown'} " make table
Plug 'voldikss/vim-translator'
"Plug 'francoiscabrol/ranger.vim' " neoranger rnvimr
"Plug 'godlygeek/tabular', {'for':['markdown','vim']} " format by table
"Plug 'junegunn/vim-easy-align' " align by char
"Plug 'ianva/vim-youdao-translater' " need python. haven't pop window
"Plug 'preservim/nerdcommenter', {'for':['go','vim']} " comment
"Plug 'tpope/vim-commentary' " comment
"Plug 'kshenoy/vim-signature' " book tag
call plug#end()





" ================================
" === colors
" ================================
syntax enable " :source $VIMRUNTIME/syntax/syntax.vim
syntax on " vim 使用缺省值覆盖自己的
color vim-nature-color
"let g:rehash256 = 1
"let g:molokai_original = 1
"colorscheme molokai
