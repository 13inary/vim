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
