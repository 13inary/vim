function! SafeShfmt()
    let l:current_buffer = join(getline(1, '$'), "\n")
    let l:formatted = system('shfmt -s', l:current_buffer)
    if v:shell_error == 0
        let l:lines = split(l:formatted, "\n")
        call setline(1, l:lines)

        " 解决格式化后的行数小于原来的行数
        let l:new_lines_count = len(l:lines)
        let l:total_lines = line('$')
        if l:new_lines_count < l:total_lines
            call deletebufline(bufnr('%'), l:new_lines_count + 1, '$')
        endif
    else
        " 若出现错误：等待确认 / 没有反应（信息太短）
        echo "shfmt error: " . l:formatted
        " 弹窗
        "if has('popupwin')
        "    call popup_create('shfmt error: ' . l:formatted, {'title': 'Error', 'border': [], 'time': 3000})
        "endif
    endif
endfunction
autocmd BufWritePre *.sh call SafeShfmt()
"autocmd BufWritePre *.sh let save_cursor = getpos(".") | execute '%!shfmt -s -' | call setpos(".", save_cursor)
