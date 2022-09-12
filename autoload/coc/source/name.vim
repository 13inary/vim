" vim source for name
function! coc#source#name#init() abort
  return {
        \ 'shortcut': 'custom',
  		\ 'filetype': ['go', 'sh'],
        \ 'triggerCharacters': ['n', 'N']
        \}
endfunction

function! coc#source#name#complete(opt, cb) abort
  let items = ['Name', 'name']
  call a:cb(items)
endfunction
