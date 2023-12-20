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
autocmd Filetype markdown inoremap ,D <esc>:call MyGenDirHeadFucMy()<cr>o<c-u>

" === 粗体 ===
" 其他格式: ____
autocmd Filetype markdown inoremap ,b ****口口口<Esc>F*hi
autocmd Filetype markdown inoremap ,s ~~~~<Space>口口口<Esc>F~hi

" === 斜体 ===
" 其他格式:  __
autocmd Filetype markdown inoremap ,i __<Space>口口口<Esc>F_i

" === 链接 ===
" 其他格式: [xxx][case-insensitice symbol]	[case-insensitice symbol]: here write link
" 其他格式: [ABC]	[ABC]: here write link
" 其他格式: http://...
" 其他格式: <...>
autocmd Filetype markdown inoremap ,a [](口口口)<Esc>F[a

" === 图片 ===
" ![alt text](link "display")
" 其他格式: ![alt text][symbol]		[symbol]: link "display"
autocmd Filetype markdown inoremap ,p ![images]()<Esc>F(a
autocmd Filetype markdown nmap <silent> go :MarkdownPreview<CR>

" === 小代码块 ===
autocmd Filetype markdown inoremap ,d ``口口口<Esc>F`i

" === 大代码块 ===
autocmd Filetype markdown inoremap ,ce ```<Enter>```<Esc>kA
autocmd Filetype markdown inoremap ,cs ```shell<Enter><Enter>```<Esc>kA
autocmd Filetype markdown inoremap ,cj ```javascript<Enter><Enter>```<Esc>kA
autocmd Filetype markdown inoremap ,cc ```c<Enter><Enter>```<Esc>kA
autocmd Filetype markdown inoremap ,cg ```go<Enter><Enter>```<Esc>kA

" === 表格 ===
" we can write : to side of '-' to right-aligned or centered
" -: right	:- left		:-:	center
" \|-\|-\|<Enter>\|\|<Enter>\|-\|-\|<Enter><Esc>2ka
autocmd Filetype markdown inoremap ,t <c-o>:TableModeEnable<cr><Enter>\|  \|<Enter>\|-\|<Enter><enter><Esc>3kla
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
autocmd Filetype markdown inoremap ,n <Enter><Enter><Enter><Enter>************************************<Enter><Enter><Enter><Enter><Enter>
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

function OpenMarkdownPreview (url)
    execute "silent ! google-chrome --disable-gpu-driver-bug-workarounds " . a:url . " &> /dev/null &"
    "execute "silent ! firefox " . a:url
    execute ":redraw!"
endfunction
let g:mkdp_browserfunc = 'OpenMarkdownPreview'

"
fun! MyGenDirHeadFucMy()
	" system("InitNewFile.sh", getcwd() bufname("%"))
	:r! /usr/local/vim/genMdCa %
endfun
