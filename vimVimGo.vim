"autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd Filetype go nmap <space>gM <esc>?\w\+(<cr>
autocmd Filetype go nmap <space>gm <esc>/\w\+(<cr>
"autocmd Filetype go nmap <space>gc :GoRename<space>
autocmd Filetype go nmap <space>gp :GoChannelPeers<space>
autocmd Filetype go nmap <silent> <space>ga :GoAlternate<CR>
"let g:go_def_mode = 'godef' " go to definition use guru but it may slow
autocmd Filetype go nmap <silent> <space>gd :GoDef<CR>
autocmd Filetype go nmap <silent> <space>gD :GoDefType<CR>
autocmd Filetype go nmap <silent> <space>gb :GoDefPop<CR>
"nmap <silent> <space>gs :GoDefStack<CR>
"let g:go_list_type = "quickfix" " cnext cprevious cclose lnext lprevious lclose
"autocmd Filetype go nmap <space>g1 :lfirst<cr>
"autocmd Filetype go nmap <space>gk :lprevious<cr>
"autocmd Filetype go nmap <space>gj :lnext<cr>
"autocmd Filetype go nmap <space>g[ :lclose<cr>
"autocmd Filetype go nmap <space>gi :GoImplements<cr>:lfirst<cr>
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
"let g:go_highlight_diagnostic_errors = 1
"let g:go_highlight_diagnostic_warnings = 1





augroup myGoProjectDirGroupMy
	autocmd!
	autocmd BufRead *.go silent call MyGoProjectDirMy()
augroup END
"let g:MyGoPathDirMy = getenv("GOPATH")
let g:MyGoMainDirMy = ""
let g:MyGoMainRelaDirMy = ""
fun! MyGoProjectDirMy()
	let l:path = getcwd()
	let l:gopath = substitute(path, "src/.*$", "src", "")
	let g:MyGoMainDirMy = path
	while !filereadable(g:MyGoMainDirMy."/main.go") && !filereadable(g:MyGoMainDirMy."/.git/config") && g:MyGoMainDirMy != "" && g:MyGoMainDirMy != gopath
		let g:MyGoMainDirMy = substitute(g:MyGoMainDirMy, "/[^/]*$", "", "")
		let g:MyGoMainRelaDirMy = g:MyGoMainRelaDirMy."../"
	endwhile
	"call setline(line("."), g:MyGoMainDirMy)
	exe "GoGuruScope ".g:MyGoMainDirMy
endfun
