" ============
" ===vim-go===
" ============
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
let g:go_metalinter_autosave = 1
"let g:go_template_autocreate = 1
" Possible options are: `snakecase`(_), `camelcase`(aBc), `lispcase`, `pascalcase`, `keep`
let g:go_addtags_transform = 'camelcase'
let g:go_metalinter_command = "gopls"

"let g:go_highlight_array_whitespace_error = 1
"let g:go_highlight_build_constraints = 1
"let g:go_highlight_chan_whitespace_error = 1
"let g:go_highlight_extra_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_format_strings = 0
let	g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
"let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
"let g:go_highlight_methods = 0
let g:go_highlight_operators = 1
"let g:go_highlight_space_tab_error = 1
"let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
"let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
"let g:go_highlight_variable_assignments = 1
let g:go_highlight_variable_declarations = 1
"let g:go_doc_keywordprg_enabled = 
