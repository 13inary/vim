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
