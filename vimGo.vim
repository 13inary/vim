" ================================
" === golang
" ================================
" === <c-j> <c-k> ===
"autocmd Filetype go nmap <silent> <c-j> <Esc>/^\t*}\\|^\t*)<CR>o
"autocmd Filetype go nmap <silent> <c-j> <Esc>:call UltiSnips#LeavingBuffer()<cr>/^\t*}\\|^\t*)<CR>o
autocmd Filetype go nmap <silent> <c-j> <esc>/\w\+\(\[[^ ,]*\]\)*(<cr>
"autocmd Filetype go imap <silent> <c-j> <Esc>/^\t*}\\|^\t*)<CR>o
autocmd Filetype go imap <silent> <c-j> <Esc>:call UltiSnips#LeavingBuffer()<cr>/^\t*}\\|^\t*)<CR>o
"autocmd Filetype go vmap <silent> <c-j> <Esc>/^\t*}\\|^\t*)<CR>o
autocmd Filetype go vmap <silent> <c-j> <Esc>:call UltiSnips#LeavingBuffer()<cr>/^\t*}\\|^\t*)<CR>o

"autocmd Filetype go nmap <silent> <c-k> o
"autocmd Filetype go nmap <silent> <c-k> <esc>:call UltiSnips#LeavingBuffer()<cr>o
autocmd Filetype go nmap <silent> <c-k> <esc>?\w\+\(\[[^ ,]*\]\)*(<cr>
"autocmd Filetype go imap <silent> <c-k> a<esc>xvl<esc>o
autocmd Filetype go imap <silent> <c-k> <esc>:call UltiSnips#LeavingBuffer()<cr>:call MyFinishLineMy()<cr>o
"autocmd Filetype go vmap <silent> <c-k> <esc>o
autocmd Filetype go vmap <silent> <c-k> <esc>:call UltiSnips#LeavingBuffer()<cr>o
"autocmd Filetype go,sh imap <silent> <esc> <esc>:call UltiSnips#JumpForwards()<cr><esc><c-[>


fun! MyFinishLineMy()
    let l:currentLine = line(".")
    let l:currentText = getline(".")
    " var xxx s
    let l:defineVarStr = matchstr(currentText, '^\t\+var \+\w\+ \+s$')
    if defineVarStr != ""
        call setline(currentLine, currentText."tring")
    endif
    " var xxx i
    let l:defineVarInt = matchstr(currentText, '^\t\+var \+\w\+ \+i$')
    if defineVarInt != ""
        call setline(currentLine, currentText."nt")
    endif
    " var xxx f
    let l:defineVarFloat6 = matchstr(currentText, '^\t\+var \+\w\+ \+f$')
    if defineVarFloat6 != ""
        call setline(currentLine, currentText."loat64")
    endif
    " var xxx b
    let l:defineVarBool = matchstr(currentText, '^\t\+var \+\w\+ \+b$')
    if defineVarBool != ""
        call setline(currentLine, currentText."ool")
    endif

    " xxx s
    let l:structFieldStr = matchstr(currentText, '^\t\+\w\+ \+s$')
    if structFieldStr != ""
        call setline(currentLine, currentText."tring")
    endif
    " xxx
    let l:structFieldStr2 = matchstr(currentText, '^\t\+\w\+ *$')
    if structFieldStr2 != ""
        call setline(currentLine, currentText." string")
    endif
    " xxx ss
    let l:structFieldStrs = matchstr(currentText, '^\t\+\w\+ \+ss$')
    if structFieldStrs != ""
        let l:newStructFieldStrs = substitute(structFieldStrs, " ss$", " []string",'g')
        call setline(currentLine, newStructFieldStrs)
    endif
    " xxx i
    let l:structFieldInt = matchstr(currentText, '^\t\+\w\+ \+i$')
    if structFieldInt != ""
        call setline(currentLine, currentText."nt")
    endif
    " xxx f
    let l:structFieldFloat6 = matchstr(currentText, '^\t\+\w\+ \+f$')
    if structFieldFloat6 != ""
        call setline(currentLine, currentText."loat64")
    endif
    " xxx b
    let l:structFieldBool = matchstr(currentText, '^\t\+\w\+ \+b$')
    if structFieldBool != ""
        call setline(currentLine, currentText."ool")
    endif
endfun



" === auto add : if err != nil { ===
augroup myAutoFillErrGroupMy
	autocmd!
	autocmd TextChangedI *.go silent exec "call MyAutoFillErrMy()"
augroup END
fun! MyAutoFillErrMy()
	if &filetype == 'go'
		let l:currentText = getline(".")

        " handle matchstr() not case Case Sensitive
        let l:errCaseText = substitute(currentText, "\t", "",'g')
        let l:errIndex = stridx(currentText, "err")
        let l:equalIndex = stridx(currentText, "=")
        if l:errIndex == -1 || l:equalIndex < l:errIndex
            return
        endif

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
		let l:lastIfMapHead = matchstr(lastText, 'map\[\w\+\]\w\+ *{$')
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
                    let l:newCurrentText = getline(line("."))
                    let l:newCurrentIfStruct = matchstr(newCurrentText, '\t\+$')
                    if newCurrentIfStruct == ""
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

command! -nargs=* GenFactory :call Gen_factory()
function! Gen_factory()
    " 使用部分文本做分析
    "let l:doc = CocAction('getHover')
    "if len(doc) == 0
    "    return
    "endif
    "let l:line = substitute(doc[0], "\n", ";",'g')

    " 使用整个文件做分析
    let current_buffer = join(getline(1, '$'), "<LF>")
    let l:content = system("smart-go factory ".shellescape(current_buffer)." ".line("."))
    if l:content == ""
        return
    endif
    let l:newLines = split(content, "\n", 1)
    let l:position = l:newLines[-1] + 1
    call append(position, newLines[0:-2])
endfunction

function! Gen_returns()
    " 使用整个文件做分析
    let current_buffer = join(getline(1, '$'), "<LF>")
    let l:content = system("smart-go returns ".shellescape(current_buffer)." ".line("."))
    if l:content == ""
        return
    endif
    let l:newLines = split(content, "\n", 1)
    let l:position = l:newLines[-1] + 1
    " 避免覆盖下一行的数据
    "call append(position, newLines[1:-2])
    "call setline(position, newLines[0:0])
    " 性能更好的做法，但会覆盖下一行数据
    call setline(position, newLines[0:-2])
    call cursor(position, col('$'))
endfunction

" 需要coc-nvim插件的CocAction('getHover')支持
"command! -nargs=* GenReqCheck :call Golang_gen_req_check()
function! Golang_gen_req_check()
    let l:doc = CocAction('getHover')
    if len(doc) == 0
        return
    endif

    let l:line = substitute(doc[0], "\n", ";",'g')
    let l:rmCode = substitute(line, "```", "//",'g')
    let l:rmTag = substitute(rmCode, "`[^`]*`", "",'g')
    let l:struct = substitute(rmTag, "", "",'g')

    "let head = search('^func', 'bnW')
    "call append(line("."), shellescape(struct))
    "execute "r!"."genReqCheck ".shellescape(struct)
    let l:content = system("genReqCheck ".shellescape(getline('.'))." ".col('.')." ".shellescape(struct)) "换行失败
    if l:content == ""
        return
    endif
    call append(line("."), "")
    let l:newContent = split(content, ";")
    for line in newContent
        call append(line("."), line)
    endfor
endfunction

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
    let l:golangReturn = matchstr(currentText, '^\t*rt$')
    if golangReturn != ""
        call Gen_returns()
        return
    endif

	let l:funcText = matchstr(currentText, '^\t*[^\t ][^\t ]$')
	if funcText != ""
		call UltiSnips#ExpandSnippet()
	endif
	"call coc#refresh()
endfun

"function! ReadJobHandler(channel, message)
"    call append(line("."), a:message."XX")
"endfunction
"
"let s:job = job_start('ping qq.com', {'out_cb': 'ReadJobHandler'})
