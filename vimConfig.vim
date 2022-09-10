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
set shiftwidth=4 " lenght of -> for all level
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
nnoremap <CR> o<Esc>
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
" === markdown
" ================================
" massage document: github:Markdown-here
" Enter 后自动缩进
autocmd Filetype markdown set autoindent
autocmd Filetype markdown set smartindent

" === 跳转 ===
autocmd Filetype markdown inoremap <c-l> <Esc>/口口口<CR>:nohlsearch<CR>c3l
"autocmd Filetype markdown inoremap <s-CR> <Esc>A<CR>

" === 标题 ===
" 其他格式: ===
autocmd Filetype markdown inoremap ,1 #<Space>
" 其他格式: ---
autocmd Filetype markdown inoremap ,2 ##<Space><Space>
autocmd Filetype markdown inoremap ,3 ###<Space><Space><Space>
autocmd Filetype markdown inoremap ,4 ####<Space><Space><Space><Space>
autocmd Filetype markdown inoremap ,5 #####<Space><Space><Space><Space><Space>
autocmd Filetype markdown inoremap ,6 ######<Space><Space><Space><Space><Space><Space>

" === 粗体 ===
" 其他格式: ____
autocmd Filetype markdown inoremap ,b ****<Space>口口口<Esc>F*hi
autocmd Filetype markdown inoremap ,s ~~~~<Space>口口口<Esc>F~hi

" === 斜体 ===
" 其他格式:  __
autocmd Filetype markdown inoremap ,i __<Space>口口口<Esc>F_i

" === 链接 ===
" 其他格式: [xxx][case-insensitice symbol]	[case-insensitice symbol]: here write link
" 其他格式: [ABC]	[ABC]: here write link
" 其他格式: http://...
" 其他格式: <...>
autocmd Filetype markdown inoremap ,a [](口口口) 口口口<Esc>F[a

" === 图片 ===
" ![alt text](link "display")
" 其他格式: ![alt text][symbol]		[symbol]: link "display"
"autocmd Filetype markdown inoremap ,p ![](口口口<Space>"口口口") 口口口<Esc>F[a

" === 小代码块 ===
autocmd Filetype markdown inoremap ,d `` 口口口<Esc>F`i

" === 大代码块 ===
autocmd Filetype markdown inoremap ,ce ```<Enter>```<Enter><Esc>2kA
autocmd Filetype markdown inoremap ,cs ```shell<Enter><Enter>```<Enter><Esc>2kA
autocmd Filetype markdown inoremap ,cj ```javascript<Enter><Enter>```<Enter><Esc>2kA
autocmd Filetype markdown inoremap ,cc ```c<Enter><Enter>```<Enter><Esc>2kA
autocmd Filetype markdown inoremap ,cg ```go<Enter><Enter>```<Enter><Esc>2kA

" === 表格 ===
" we can write : to side of '-' to right-aligned or centered
" -: right	:- left		:-:	center
" \|-\|-\|<Enter>\|\|<Enter>\|-\|-\|<Enter><Esc>2ka
autocmd Filetype markdown inoremap ,t <c-o>:TableModeEnable<cr>\|-\|<Enter>\|  \|<Enter>\|-\|<Enter><enter><Esc>3kla
autocmd Filetype markdown inoremap <silent> ,l <esc>:call tablemode#spreadsheet#InsertColumn(1)<CR>
autocmd Filetype markdown inoremap <silent> ,q <esc>:call MyMdExitTableMy()<cr>a
fun! MyMdExitTableMy()
	:execute "normal :TableModeRealign\<CR>"
	:execute "normal :TableModeEnable\<CR>"
	:execute "normal :TableModeDisable\<CR>"
	let l:tableEnd = search("^$","nW")
	if tableEnd != 0
		let l:tabEndEnd = getline(tableEnd+1)
		if tabEndEnd == ""
			call cursor(tableEnd+1, 1)
		endif
	endif
endfun
augroup myFillTableGroupMy
	autocmd!
	autocmd TextChangedI *.md silent exec "call MyFillTableMy()"
augroup END
fun! MyFillTableMy()
	let l:currentText = getline(".")
	if currentText == ""
		let l:lastText = getline(line(".")-1)
		let l:lastEnd = matchstr(lastText, '^|\(-\+|\)\+$')
		" add new line after table
		if lastEnd != ""
			let l:newLine = substitute(lastEnd, "\-\\+", "  ", "")
			let l:newLine = substitute(newLine, "\-\\+", " 口口口 ", "g")
			call setline(line("."), newLine)
			call append(line("."), lastEnd)
			call cursor(line("."), 3)
			:execute "normal :TableModeEnable\<CR>"
			return
		endif
		let l:lastInside = matchstr(lastText, '^|\(.\+|\)\+$')
		" add new line in table. default : lastEnd == ""
		if lastInside != ""
			let l:newLine = substitute(lastInside, "[^|]\\+", " 口口口 ", "g")
			let l:newLine = substitute(newLine, "[^|]\\+", "  ", "")
			call setline(line("."), newLine)
			call cursor(line("."), 3)
			:execute "normal :TableModeEnable\<CR>"
		endif
	endif
endfun
" may use more time
"augroup myFixTable
	"autocmd!
	"autocmd TextChanged *.md silent exec ":TableModeRealign"
	"autocmd TextChangedP *.md silent exec ":TableModeRealign"
"augroup END

" === 块 ===
" higher use: >><Space>
"autocmd Filetype markdown inoremap ,12313 ><Space> 口口口

" === 大横线 ===
" 其他格式: *** ___
"autocmd Filetype markdown inoremap ,l <Enter><Enter><Enter><Enter>--------------------------------<Enter><Enter><Enter><Enter><Enter>
autocmd Filetype markdown imap <silent> <c-k> <esc>o
autocmd Filetype markdown imap <silent> <c-j> <esc>/^\|\(-\+\|\)\+<cr>o

" === 列表 ===
" 其他格式: <number>.<Space> -<Space> +<Space>
"autocmd Filetype markdown inoremap ,100 *<Space>口口口
augroup myOrderOrderNumberGroupMy
	autocmd!
	autocmd TextChangedI *.md silent exec "call MyOrderOrderNumberMy()"
augroup END
fun! MyOrderOrderNumberMy()
	let l:currentLine = line(".")
	let l:currentText = getline(".")
	let l:lastText = getline(line(".")-1)
	let l:nextText = getline(line(".")+1)
	let l:lastOrder = matchstr(lastText, '^[0-9]\+\. \+[^ ]\+')
	let l:lastOrderE = matchstr(lastText, '^[0-9]\+\. *$')
	let l:nextOrder = matchstr(nextText, '^[0-9]\+\. ')
	"call append(line(".")+1, lastOrder)
	if currentText == "" && lastOrder != ""
		let l:newText = matchstr(lastOrder, '^[0-9]\+\. \+')
		call setline(currentLine, newText)
		let l:forLine = currentLine + 1
		while nextOrder != ""
			:execute "normal j^\<c-a>"
			"call setline(forLine, nextOrder)
			let forLine = forLine + 1
			let nextText = getline(forLine)
			let nextOrder = matchstr(nextText, '^[0-9]\+\. ')
		endwhile
		call cursor(currentLine, 1)
		:execute "normal ^\<c-a>$a "
	elseif currentText == "" && lastOrderE != ""
		call setline(currentLine-1, "")
	endif
endfun





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
	:r! ~/.vim/InitNewFile `pwd` %
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
" === golang
" ================================
" === <c-j> <c-k> ===
"autocmd Filetype go nmap <silent> <c-j> <Esc>/^\t*}\\|^\t*)<CR>o
autocmd Filetype go nmap <silent> <c-j> <Esc>:call UltiSnips#LeavingBuffer()<cr>/^\t*}\\|^\t*)<CR>o
"autocmd Filetype go imap <silent> <c-j> <Esc>/^\t*}\\|^\t*)<CR>o
autocmd Filetype go imap <silent> <c-j> <Esc>:call UltiSnips#LeavingBuffer()<cr>/^\t*}\\|^\t*)<CR>o
"autocmd Filetype go vmap <silent> <c-j> <Esc>/^\t*}\\|^\t*)<CR>o
autocmd Filetype go vmap <silent> <c-j> <Esc>:call UltiSnips#LeavingBuffer()<cr>/^\t*}\\|^\t*)<CR>o
"autocmd Filetype go nmap <silent> <c-k> o
autocmd Filetype go nmap <silent> <c-k> <esc>:call UltiSnips#LeavingBuffer()<cr>o
"autocmd Filetype go imap <silent> <c-k> a<esc>xvl<esc>o
autocmd Filetype go imap <silent> <c-k> <esc>:call UltiSnips#LeavingBuffer()<cr>o
"autocmd Filetype go vmap <silent> <c-k> <esc>o
autocmd Filetype go vmap <silent> <c-k> <esc>:call UltiSnips#LeavingBuffer()<cr>o
"autocmd Filetype go,sh imap <silent> <esc> <esc>:call UltiSnips#JumpForwards()<cr><esc><c-[>

" === auto add : if err != nil { ===
augroup myAutoFillErrGroupMy
	autocmd!
	autocmd TextChangedI *.go silent exec "call MyAutoFillErrMy()"
augroup END
fun! MyAutoFillErrMy()
	if &filetype == 'go'
		let l:currentText = getline(".")
		" 只返回err
		let l:currentIfErr = matchstr(currentText, '\t\+err *:\?= *\(\w\+\.\)*\w\+(.*)$')
		if currentIfErr != ""
			let l:currentLine = line(".")
			let l:lineTab = matchstr(currentText, '\t\+')
			let l:newCurrentText = substitute(currentText, "\t", "",'g')
			call setline(currentLine, lineTab."if ".newCurrentText."; err != nil {")
			call append(currentLine, lineTab."}")
			call append(currentLine, lineTab."\treturn  \t ")
			call search("()","Wc")
			call cursor(currentLine, col(".")+1)
			" 终止下面的判断
			return
		endif
		" 多个返回结果，但无外部要使用的变量
		let l:currentIfMErr = matchstr(currentText, '\t\+\(_ *, *\)\+err *:\?= *\(\w\+\.\)*\w\+(.*)$')
		if currentIfMErr != ""
			let l:currentLine = line(".")
			let l:lineTab = matchstr(currentText, '\t\+')
			let l:newCurrentText = substitute(currentText, "\t", "",'g')
			call setline(currentLine, lineTab."if ".newCurrentText."; err != nil {")
			call append(currentLine, lineTab."}")
			call append(currentLine, lineTab."\treturn  \t ")
			call search("()","Wc")
			call cursor(currentLine, col(".")+1)
			" 终止下面的判断
			return
		endif
		" 返回值有变量接受，同一使用独立的if err != nil {
		let l:currentIfGErr = matchstr(currentText, '\t\+\(\w\+ *, *\)\+err *:\?= *\(\w\+\.\)*\w\+(.*)$')
		if currentIfGErr != ""
			let l:nextText = getline(line(".")+1)
			let l:lastIfCan = matchstr(nextText, 'if err != nil {')
			if lastIfCan == ""
				let l:currentLine = line(".")
				let l:lineTab = matchstr(currentText, '\t\+')
				call append(line("."), lineTab."}")
				"call append(line("."), "")
				call append(line("."), lineTab."\treturn  \t ")
				call append(line("."), lineTab."if err != nil {")
			endif
			" 终止下面的判断
			return
		endif

	endif
endfun

" === auto fill map,feild of map,feild of struct ===
" 触发格式：
" ....map[..]..{
" 	光标位置
" }...
" 触发格式：
" ..xx : xx,
" 	光标位置
" }...
augroup myAutoFillMapGroupMy
	autocmd!
	autocmd TextChangedI *.go silent exec "call MyAutoFillMapMy()"
augroup END
fun! MyAutoFillMapMy()
	if &filetype == 'go'
		let l:lastText = getline(line(".")-1)
		let l:lastIfMapHead = matchstr(lastText, 'map\[\w\+\]\w\+{$')
		" 创建map
		" 匹配头部
		if lastIfMapHead != ""
			let l:nextText = getline(line(".")+1)
			let l:nextIfMapHead = matchstr(nextText, '\t\+}')
			" 匹配下面
			if nextIfMapHead != ""
				let l:currentText = getline(".")
				let l:currentIfMap = matchstr(currentText, '\t\+$')
				" 匹配中间
				if currentIfMap != ""
					let l:currentLine = line(".")
					let l:myCol = col(".")
					" 获取key
					let l:newMapKey = matchstr(lastIfMapHead, ".*\]")
					let newMapKey = matchstr(newMapKey, "map\[.*")
					let l:setMapKey = ''
					if newMapKey == "map[string]"
						let setMapKey = '"k": '
					else
						let setMapKey = ' k : '
					endif
					" 获取value
					let l:newMapVal = matchstr(lastIfMapHead, "\].*{")
					let l:setMapVal = ''
					if newMapVal == "]string{"
						let setMapVal = '"s"'
					elseif newMapVal == "]bool{"
						let setMapVal = 'true'
					elseif newMapVal == "]int{"
						let setMapVal = '1'
					elseif newMapVal == "]int64{"
						let setMapVal = '1'
					elseif newMapVal == "]float64{"
						let setMapVal = '1.0'
					else
						let setMapVal = '1'
					endif
					call setline(currentLine, currentIfMap.setMapKey.setMapVal.',')
					:stopinsert
					norm 0fks
					call cursor(currentLine, myCol+1)
				endif
			endif
			return
		endif
		
		" 创建map字段 || 结构体字段
		" 匹配上面
		let l:lastIfMap = matchstr(lastText, '\t\+.\+: *.\+,$')
		if lastIfMap != ""
			let l:nextText = getline(line(".")+1)
			let l:nextIfMapA = matchstr(nextText, '\t\+}')
			let l:nextIfMapB = matchstr(nextText, '\t\+.\+: *.\+,$')
			" 匹配下面
			if nextIfMapA != "" || nextIfMapB != ""
				let l:currentText = getline(".")
				let l:currentIfMap = matchstr(currentText, '\t\+$')
				" 匹配中间
				if currentIfMap != ""
					let l:currentLine = line(".")
					let l:myCol = col(".")
					let l:newMapType = matchstr(lastIfMap, '\".*\":')
					let l:newMapValu = matchstr(lastIfMap, ': *.\+,')
					if newMapType != ""
						call setline(currentLine, currentIfMap.'"k"'.newMapValu)
					else
						call setline(currentLine, currentIfMap.' k '.newMapValu)
					endif
					:stopinsert
					norm 0fks
					call cursor(currentLine, myCol+1)
				endif
			endif
			return
		endif
	endif
endfun

" === auto fill struct ===
" 触发格式：
" ....xxx{
" 	光标位置
" }
augroup myAutoFillStructGroupMy
	autocmd!
	autocmd TextChangedI *.go silent exec "call MyAutoFillStructMy()"
augroup END
"autocmd Filetype go imap <silent> <c-k> <Esc>?: \\|:= \\|= \\|\t}<CR>nw
fun! MyAutoFillStructMy()
	if &filetype == 'go'
		let l:lastText = getline(line(".")-1)
		let l:lastIfStruct = matchstr(lastText, '&\?[^\[\] ]\+{$')
		" 匹配头部
		if lastIfStruct != "" 
			let l:nextText = getline(line(".")+1)
			let l:nextIfStruct = matchstr(nextText, '\t\+}')
			" 匹配下面
			if nextIfStruct != ""
				let l:currentText = getline(".")
				let l:currentIfStruct = matchstr(currentText, '\t\+$')
				" 匹配中间
				if currentIfStruct != ""
					let l:currentLine = line(".")
					:GoFillStruct
					:stopinsert
					call cursor(currentLine, 1)
					norm $
					let l:wordEnd = col(".")
					" 下面的F后面的 空格 是必须的
					norm F 
					let l:wordStart = col(".")
					call cursor(currentLine, wordEnd-1)
					norm gh
					call cursor(currentLine, wordStart+1)
					"norm $vF \<c-g>
				endif
			endif
			return
		endif
	endif
endfun

" === location next place ===
" 要保证 \\w\\+{$ 是结构体的开头，也就是函数的 { 前面要保留至少一个空格
"autocmd Filetype go imap <silent> <c-l> <Esc>:call JumpPreVal()<CR>
autocmd Filetype go imap <silent> <c-l> <Esc>:call MyJumpNextValMy()<CR>
"autocmd Filetype go vmap <silent> <c-l> <Esc>:call JumpPreVal()<CR>
autocmd Filetype go vmap <silent> <c-l> <Esc>:call MyJumpNextValMy()<CR>
fun! MyJumpNextValMy()
	let l:oldPosiLine = line(".")
	let l:oldPosiCol = col(".")
	let l:preFunHead = search("\\w\\+{$","bnWc")
	let l:preFunEnd = search("\t\\+}","bnWc")

	" 确定现在在 结构体{ 下面
	if preFunHead > preFunEnd && preFunHead != oldPosiLine
		let l:nextFunEnd = search("\t\\+}","nW")
		let l:nextFunHead = search("\\w\\+{$","nW")
		" 确定现在在 } 上面
		if nextFunEnd < nextFunHead || nextFunHead == 0
			" 目前是最后一个字段的值的位置的话：回到第一个字段上面（没有字段的结构体不需要换行{}）
			let l:nextPosi = search(": *.*,", "n")
			if oldPosiLine+1 == nextFunEnd && nextPosi+1 != nextFunEnd
				call cursor(preFunHead, oldPosiCol)
			endif
			" 查找下一个字段
			let l:newPosi = search(": *.*,","n")
			if newPosi > preFunHead && newPosi < nextFunEnd
				" 现在 已经找到并确定位置，开始准备移动
				call search(": *.*,")
				let l:currentLine = line(".")
				norm $
				let l:wordEnd = col(".")
				" F后面的 空格 是必须的
				norm F 
				let l:wordStart = col(".")
				call cursor(currentLine, wordEnd-1)
				norm gh
				call cursor(currentLine, wordStart+1)
			endif
		endif
	else
		" 不是结构体内的情况：查找定位点
		let l:canFindA = search("<???>","n")
		if canFindA != 0
			call search("<???>")
			let l:curLine = line(".")
			let l:wordStart = col(".")
			norm gh
			"call cursor(curLine, wordStart)
			return
		endif

		let l:oldLine = line(".")
		let l:canFindB = search("))","n")
		if canFindB != 0 && canFindB == oldLine
			call search("))")
			let l:curLine = line(".")
			let l:wordStart = col(".")
			norm li, 
			:stopinsert
			norm l
			:startinsert
			"call cursor(curLine, wordStart)
			return
		endif

		let l:canFindC = search(" \t ","n")
		if canFindC != 0
			call search(" \t ")
			let l:curLine = line(".")
			let l:wordStart = col(".")
			norm gh
			"call cursor(curLine, wordStart)
			return
		endif
	endif
endfun

" === auto do annotation ===
"augroup myAutoAnnotationGroup
"	autocmd!
"	autocmd TextChangedI *.go silent exec "call AutoAnnotation()"
"augroup END
"fun AutoAnnotation()
"	let l:currentText = getline(".")
"
"	let l:funcText = matchstr(currentText, 'func \w\+()')
"	if funcText != ""
"		let l:funcName = matchstr(matchstr(currentText, '\w\+()'), '[a-z,A-Z,0-9,_]\+')
"		let l:lastLine = line(".")-1
"		let l:lastText = getline(lastLine)
"		let l:lastHead = matchstr(lastText, '// \w\+ ')
"		if lastHead != "// ".funcName." "
"			call append(lastLine, "// ".funcName." ")
"		endif
"		"call append(line(".")-2, myLastText."XX")
"	endif
"
"endfun

" === auto snippets by two char ===
"inoremap <expr> <cr> coc#_select_confirm()
augroup mySnippetGroupMy
	autocmd!
	autocmd TextChangedP *.go silent call MyAutoSnippetMy()
	autocmd TextChangedI *.go silent call MyAutoSnippetMy()
augroup END
fun! MyAutoSnippetMy()
	"let l:ifExpand = pumvisible()
	"let l:curCol = col(".")
	"exe "norm <c-y>"
	let l:currentText = getline(".")
	let l:funcText = matchstr(currentText, '^\t*..$')
	if funcText != ""
		call UltiSnips#ExpandSnippet()
	endif
	"call coc#refresh()
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
call plug#begin('~/.vim/plugged')
"Plug 'dense-analysis/ale' " check grammar
Plug 'gvls/vim-nature-color' " vim color
Plug 'francoiscabrol/ranger.vim' " neoranger rnvimr
Plug 'airblade/vim-gitgutter' " git : show add, change, remove
Plug 'tpope/vim-surround' " CUID surround of text
Plug 'neoclide/coc.nvim', {'branch':'release'} " need install nodejs npm yarn
Plug 'jiangmiao/auto-pairs', {'for':['go','vim','sh','markdown','json','proto']} " {} [] () ...
Plug 'fatih/vim-go', {'for':'go', 'do':':GoInstallBinaries'} " IDE for golang
Plug 'ctrlpvim/ctrlp.vim', {'for':'go'} " help search text
"Plug 'junegunn/fzf.vim'
"Plug 'junegunn/fzf'
Plug 'SirVer/ultisnips', {'for':'go'} " snippets
"Plug 'honza/vim-snippets', {'for':'go'}
Plug 'buoto/gotests-vim', {'for':'go'}
Plug 'tenfyzhong/gengotag', {'for': 'go'} " use configuration file generate struct. need cd directory and go build
Plug 'vim-scripts/argtextobj.vim', {'for':'go'}
Plug 'godlygeek/tabular', {'for':['markdown','vim']}
Plug 'dhruvasagar/vim-table-mode', {'for':'markdown'} " make table
"Plug 'ianva/vim-youdao-translater'
"Plug 'preservim/nerdcommenter', {'for':['go','vim']}
"Plug 'junegunn/vim-easy-align'
":call mkdp#util#install()
"Plug 'vim-signiture'
call plug#end()

" === PlugInstall ===
fun! UpdateMyAllPlugins()
	exec "PlugUpgrade"
	exec "PlugUpdate"
	exec "GoUpdateBinaries"
endfun





" ================================
" === colors
" ================================
syntax enable " :source $VIMRUNTIME/syntax/syntax.vim
syntax on " vim 使用缺省值覆盖自己的
color vim-nature-color
"let g:rehash256 = 1
"let g:molokai_original = 1
"colorscheme molokai





" ================================
" === ranger
" ================================
let g:ranger_map_keys = 0
nmap <silent> <space>ra :RangerCurrentFileExistingOrNewTab<CR>





" ================================
" === gitgutter
" ================================
" '[c' ']c' jump to change
"let g:gitgutter_diff_relative_to = 'working_tree'
"let g:gitgutter_git_args = '--git-dir-""'
"let g:gitgutter_diff_args = '-w'
"let g:gitgutter_use_location_list = 1
"let g:gitgutter_sign_allow_clobber = 0
"g:gitgutter_show_msg_on_hunk_jumping
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_removed_above_and_below = '{'
let g:gitgutter_sign_modified_removed = '_~'
fun! GitStatusA()
	if exists("*GitGutterGetHunkSummary")
		let [a,m,r] = GitGutterGetHunkSummary()
		return a > 0?''.a.'':' '
	else
		return ' '
	endif
  	"return printf('+%d ~%d -%d', a, m, r)
endfun
fun! GitStatusM()
	if exists("*GitGutterGetHunkSummary")
		let [a,m,r] = GitGutterGetHunkSummary()
		return m > 0?''.m.'':' '
	else
		return ' '
	endif
endfun
fun! GitStatusR()
	if exists("*GitGutterGetHunkSummary")
		let [a,m,r] = GitGutterGetHunkSummary()
		return r > 0?''.r.'':' '
	else
		return ' '
	endif
endfun
let g:gitgutter_map_keys = 0 " disable all map by plugin
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)
nmap <space>hs <Plug>(GitGutterStageHunk)
nmap <space>hu <Plug>(GitGutterUndoHunk)
nmap <silent> <space>hp :call MyGitHunkFloatMy()<cr>
fun! MyGitHunkFloatMy()
	let g:gitgutter_preview_win_floating = 1
	exe "GitGutterPreviewHunk"
endfun
let g:gitgutter_close_preview_on_escape = 1
nmap <space>hP :call MyGitHunkWinMy()<cr>
fun! MyGitHunkWinMy()
	let g:gitgutter_preview_win_floating = 0
	exe "GitGutterPreviewHunk"
endfun
" use 'zr' to show part
" set foldtext=gitgutter#fold#foldtext()
nmap <space>hf :GitGutterFold<cr>
"omap <space>ih <Plug>(GitGutterTextObjectInnerPending)
"omap <space>ah <Plug>(GitGutterTextObjectOuterPending)
"xmap <space>ih <Plug>(GitGutterTextObjectInnerVisual)
"xmap <space>ah <Plug>(GitGutterTextObjectOuterVisual)
command! Gqf GitGutterQuickFix | copen





" ================================
" === vim-table-mode
" ================================
" use key(\tm) to enable
"function! s:isAtStartOfLine(mapping)
"  let text_before_cursor = getline('.')[0 : col('.')-1]
"  let mapping_pattern = '\V' . escape(a:mapping, '\')
"  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
"  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
"endfunction
"inoreabbrev <expr> <bar><bar>
"          \ <SID>isAtStartOfLine('\|\|') ?
"          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
"inoreabbrev <expr> __
"          \ <SID>isAtStartOfLine('__') ?
"          \ '<c-o>:silent! TableModeDisable<cr>' : '__'





" ================================
" === ultisnips
" ================================
" :smap to get map list
let g:UltiSnipsExpandTrigger="<c-c>" " ,e <tab>
let g:UltiSnipsJumpForwardTrigger="<c-l>" " ,f <c-b>
let g:UltiSnipsJumpBackwardTrigger="" " <c-b> <c-z> ,F
let g:UltiSnipsListSnippets="<c-b>"
"let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/myUltiSnips'] 
let b:UltiSnipsSnippetDirectories=[$HOME.'/.vim/myUltiSnips']





" ================================
" === vim-go
" ================================
"autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd Filetype go nmap <space>gM <esc>?\w\+(<cr>
autocmd Filetype go nmap <space>gm <esc>/\w\+(<cr>
autocmd Filetype go nmap <space>gc :GoRename<space>
augroup myGoProjectDirGroupMy
	autocmd!
	autocmd BufRead *.go silent call MyGoProjectDirMy()
augroup END
"let g:MyGoPathDirMy = getenv("GOPATH")
let g:MyGoMainDirMy = ""
fun! MyGoProjectDirMy()
	let l:path = getcwd()
	let l:gopath = substitute(path, "src/.*$", "src", "")
	let g:MyGoMainDirMy = path
	while !filereadable(g:MyGoMainDirMy."/main.go") && g:MyGoMainDirMy != "" && g:MyGoMainDirMy != gopath
		let g:MyGoMainDirMy = substitute(g:MyGoMainDirMy, "/[^/]*$", "", "")
	endwhile
	"call setline(line("."), g:MyGoMainDirMy)
	exe "GoGuruScope ".g:MyGoMainDirMy
endfun
autocmd Filetype go nmap <space>gC :GoChannelPeers<space>
autocmd Filetype go nmap <silent> <space>ga :GoAlternate<CR>
"let g:go_def_mode = 'godef' " go to definition use guru but it may slow
autocmd Filetype go nmap <silent> <space>gd :GoDef<CR>
autocmd Filetype go nmap <silent> <space>gD :GoDefType<CR>
autocmd Filetype go nmap <silent> <space>gb :GoDefPop<CR>
"nmap <silent> <space>gs :GoDefStack<CR>
"let g:go_list_type = "quickfix" " cnext cprevious cclose lnext lprevious lclose
autocmd Filetype go nmap <space>g1 :lfirst<cr>
autocmd Filetype go nmap <space>gk :lprevious<cr>
autocmd Filetype go nmap <space>gj :lnext<cr>
autocmd Filetype go nmap <space>g[ :lclose<cr>
autocmd Filetype go nmap <space>gi :GoImplements<cr>:lfirst<cr>
autocmd Filetype go nmap <space>gI :GoImpl<space>
let g:go_fillstruct_mode = 'gopls' " 'fillstruct'
autocmd Filetype go nmap <silent> <space>gs :GoFillStruct<CR>[m/:<CR>w
autocmd Filetype go nmap <silent> <space>gv :GoSameIdsAutoToggle<CR>
"let g:go_decls_includes = "func,type"
autocmd Filetype go nmap <silent> <space>gf :GoDecls<CR>
autocmd Filetype go nmap <silent> <space>gF :GoDeclsDir<CR>
autocmd Filetype go nmap <space>gt :GoAddTags<space>
autocmd Filetype go nmap <space>gT :GoRemoveTags<space>
let g:go_addtags_transform = 'camelcase' " Possible options are: `snakecase`(a_b_c), `camelcase`(aBc), `lispcase(a-b-c)`, `pascalcase(AbCd)`, `keep`

" === debug window ===
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

" === basic settings ===
let g:go_auto_type_info = 1 "show type of function , variate
let g:go_updatetime = 100 " update time
"let g:go_auto_sameids = 0 " hilight for same variate
let g:go_term_enabled = 1 " inside terminal
let g:go_term_width = 40
"let g:go_term_height = 5
let g:go_term_mode = "rightbelow vsplit"
"let g:go_fmt_autosave = 1 " do after save 
"let g:go_imports_autosave = 1
"let g:go_mod_fmt_autosave = 1
"let g:go_asmfmt_autosave = 0
"let g:go_template_autocreate = 1
"let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
"let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_command = "gopls"
"let g:go_metalinter_deadline = "5s"

" === hightlight ===
let g:go_highlight_operators = 1 " := + - * /
let g:go_highlight_variable_declarations = 1 " variate of :=
"let g:go_highlight_trailing_whitespace_error = 0 " space in tail of line
"let g:go_highlight_space_tab_error = 0 " tab after space
"let g:go_highlight_chan_whitespace_error = 0 " space beside <- ->
"let g:go_highlight_array_whitespace_error = 0 " space beside []
let	g:go_highlight_function_calls = 1 " call function
"let g:go_highlight_functions = 0 " function methon declaration
"let g:go_highlight_function_parameters = 0 " parameter of function
let g:go_highlight_types = 1 " struct and interface name
"let g:go_highlight_fields = 0 " struct field name
"let g:go_highlight_string_spellcheck = 1 " when 'spell' is enable
"let g:go_highlight_format_strings = 1 " %s %v %d
"let g:go_highlight_variable_assignments = 0 " variate of =
"let g:go_highlight_diagnostic_errors = 1
"let g:go_highlight_diagnostic_warnings = 1
"let g:go_highlight_generate_tags = 0 " hightlight generate text
"let g:go_highlight_build_constraints = 0 " build flag on head of file
"let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1 " lib type (io.Reader) unsafe.Pointer context.Context
"let g:go_fold_enable = "block"





" ================================
" ===coc v0.0.82
" ================================
" :h coc-variable
"let g:coc_node_path =

" automaticly install extensions when open vim
"let g:coc_global_extensions = ['coc-snippets', 'coc-translator']
"let g:coc_global_extensions = ['coc-snippets']
"imap ,e <Plug>(coc-snippets-expand)

"set hidden " TextEdit might fail if hidden is not set.

" Some servers have issues with backup files, see #649.
"set nobackup
"set nowritebackup

"set cmdheight=1 " Give more space for displaying messages.

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100
set shortmess+=c " Don't pass messages to |ins-completion-menu|.

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" number of line and sign in same column
if has("nvim-0.5.0") || has("patch-8.1.1564")
	" Recently vim can merge signcolumn and number column into one
	"set signcolumn=number
	set signcolumn=yes
else
	set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"return !col || getline('.')[col - 1]  =~ '\s'

"Map <tab> for trigger completion, completion confirm, snippet expand and jump
"like VSCode: >
"  inoremap <silent><expr> <TAB>
"    \ coc#pum#visible() ? coc#_select_confirm() :
"    \ coc#expandableOrJumpable() ?
"    \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"    \ CheckBackSpace() ? "\<TAB>" :
"    \ coc#refresh()
"  function! CheckBackSpace() abort
"    let col = col('.') - 1
"    return !col || getline('.')[col - 1]  =~# '\s'
"  endfunction
"  let g:coc_snippet_next = '<tab>'
"<
"Note: the `coc-snippets` extension is required for this to work.

" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" swtich next diagnostics. map key example: <space>gn <space>gN [g ]g
autocmd Filetype go,vim nmap <silent> [e <Plug>(coc-diagnostic-prev)
autocmd Filetype go,vim nmap <silent> ]e <Plug>(coc-diagnostic-next)

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

" scroll pum
inoremap <silent><expr> <PageDown> coc#pum#visible() ? coc#pum#scroll(1) : "\<PageDown>"
inoremap <silent><expr> <PageUp> coc#pum#visible() ? coc#pum#scroll(0) : "\<PageUp>"

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
"call coc#config('languageserver', {
"			\ 'ccls': {
"			\   "command": "ccls",
"			\   "trace.server": "verbose",
"			\   "filetypes": ["c", "cpp", "objc", "objcpp"]
"			\ }
"			\})

"Disable completion for buffer: |b:coc_suggest_disable|
"Disable specific sources for buffer: |b:coc_disabled_sources|
"Disable words for trigger completion: |b:coc_suggest_blacklist|
"Add additional keyword characters: |b:coc_additional_keywords|





" ================================
" === auto-pairs
" ================================
"let g:AutoPairsShortcutFastWrap = '<c-l>'
let g:AutoPairsMapSpace = 0





" ================================
" === gotests
" ================================
let g:gotests_bin = '/home/zombie/go/bin/gotests'
