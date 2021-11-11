" source xx/xx/vimrc

"if exists("g:load_change_color_scheme")
"    finish
"endif
"let g:load_change_color_scheme = 1
"nnoremap mm :colors  
"nnoremap mn :vsp ~/documents/git/git.md
"autocmd BufReadPost $MYVIMRC source $MYVIMRC


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
" table
set tabstop=4
" lenght of -> for all level
set shiftwidth=4

" ============
" basic map
" ============
" enter in normal model
nnoremap <CR> o<Esc>
"inoremap <S-CR> i<CR><Esc>
":autocmd CmdwinEnter * nnoremap <CR> <CR>
":autocmd BufReadPost quickfix nnoremap <CR> <CR>
inoremap <s-tab> <c-x><c-f>
" space in normal model
nnoremap <space> i <Esc>

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



" ===========
" ===ranger===
" ===========
" let g:ranger_map_keys = 0



" ============
" ===vim-go===
" ============
"show type of function , variate
let g:go_auto_type_info = 1
" update time
let g:go_updatetime = 100
" hilight for same variate
"let g:go_auto_sameids = 1
" inside terminal
let g:go_term_enabled = 1
let g:go_term_width = 30
let g:go_term_mode = "rightbelow vsplit"
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




" ===========
" ===coc=====
" ===========
" automaticly install extensions when open vim
" let g:coc_global_extensions = ['coc-go', 'coc-json', 'coc-marketplace']
"
"" TextEdit might fail if hidden is not set.
"set hidden
"
"" Some servers have issues with backup files, see #649.
"set nobackup
"set nowritebackup
"
"" Give more space for displaying messages.
"set cmdheight=2
"
"" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
"" delays and poor user experience.
set updatetime=100
"
"" Don't pass messages to |ins-completion-menu|.
"set shortmess+=c

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


function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
" call complement
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

"" Make <CR> auto-select the first completion item and notify coc.nvim to
"" format on enter, <cr> could be remapped by other vim plugin
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
	"\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" swtich next error
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

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
"
"" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')
"
"" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)
"
"" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"
"augroup mygroup
	"autocmd!
	"" Setup formatexpr specified filetype(s).
	"autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	"" Update signature help on jump placeholder.
	"autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end
"
"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"
"" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)
"
"" Map function and class text objects
"" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)
"xmap ic <Plug>(coc-classobj-i)
"omap ic <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)
"
"" Remap <C-f> and <C-b> for scroll float windows/popups.
"if has('nvim-0.4.0') || has('patch-8.2.0750')
	"nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	"nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	"inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
	"inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
	"vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	"vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"endif
"
"" Use CTRL-S for selections ranges.
"" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)
"
"" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocAction('format')
"
"" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
"" Add (Neo)Vim's native statusline support.
"" NOTE: Please see `:h coc-status` for integrations with external plugins that
"" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
"" Mappings for CoCList
"" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>



" =====================
" ====function=========
" =====================
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
		:GoRun %
		":rightbelow vert term ++cols=30 go run %
		":rightbelow vert term ++cols=40 go run 
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



" =================
" vim plug manager
" =================
" vimawesome.com
" install nodejs npm yarn
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', {'for':'go'}
"Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'for':['go','vim'], 'branch':'release'}
"Plug 'jiangmiao/auto-pairs'
"Plug 'ianva/vim-youdao-translater'
"Plug 'scrooloose/nerdtree'
"Plug 'coc'
"Plug 'iamcco/markdown-preview.nvim'
"Plug 'vim-table-mode'
"Plug 'vim-signiture'
"Plug 'hte nerd tree'
call plug#end()
" PlugInstall
