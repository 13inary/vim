" ================================
" === auto-pairs
" ================================
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`"}
"au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'}, ['{'])
au Filetype markdown let b:AutoPairs = AutoPairsDefine({'```':'```', '"""':'"""', "'''":"'''"})
au Filetype html let b:AutoPairs = AutoPairsDefine({"<":">"})

"let g:AutoPairsShortcutToggle = '<M-p>'
"let g:AutoPairsShortcutFastWrap = '<M-e>'
let g:AutoPairsShortcutFastWrap = ''
"let g:AutoPairsShortcutJump = '<M-n>'

"let g:AutoPairsFlyMode = 0
let g:AutoPairsFlyMode = 1
"let g:AutoPairsShortcutBackInsert = '<M-b>'

"let g:AutoPairsMapCh = 1
"let g:AutoPairsMapBS = 1
"let g:AutoPairsMapCR = 1

"let g:AutoPairsCenterLine = 1
let g:AutoPairsCenterLine = 0
"let g:AutoPairsMapSpace = 1

"let g:AutoPairsMultilineClose = 1

"let g:AutoPairsMoveCharacter = "()[]{}\"'"

" not auto pairs
" i. Ctrl-V )
" ii. use Alt-P to turn off the plugin.
" iii. use DEL or x to delete the character insert by plugin.
