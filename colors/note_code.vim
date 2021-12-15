" =======================================
" Filw: custom vim colorscheme
" Description: suitable for cterm
" Author:
" Repository: https://github.com/keysquivered/
" =======================================



" help
" ====
" :highlight
" help document
" 	$VIMRUNTIME/vimXX/doc/syntax.txt
" teacher of colorscheme
" 	:edit $VIMRUNTIME/colors/README.txt
" tyep of current term
" 	`echo $TERM`
" show all colors for current colorscheme
" 	`:so $VIMRUNTIME/syntax/hitest.vim`
" show current name of current colorscheme
" 	`:colors`
" show position of setting 
" 	:verbose hi <property1>



" PreSetting
" =======
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif
" set terminal color
set t_Co=256
"if has('termguicolors')
"	set termguicolors
"endif
let g:colors_name = "note_code"



" ColorPallete
" ============
" 15 7 253
let myWhite		=   253
" 244~250
let myGray		=   248
" 232
let myBlack		=   232
" 32 38 39
let myBlue		=   39
" 79 121 85 49 122
let myGreen		=   121
" 11 226
let myYellow	=   226
" 172 214
let myOrange	=   214
" 160 9 196
let myRed		=   196
" 199 162
let myPink		=   199
" 127~129
let myPurple	=   127




" color setting
" =============
":exe 'highlight <property1> <property2> <property3> <property4>'
" property1: Normal IncSearch ...
" property2: guifg guibg guisp gui
" property3: term
" property4: ctermfg ctermbg cterm
" property='.<value>.'
" property= NONE
" underline bold underline undercurl inverse
" italic standout nocombine strikethrough



" Basic Highlighting (see :help group-name)
" =========================================
" 196 121 is the test
hi Comment 			ctermfg=248  ctermbg=NONE cterm=NONE

hi Constant 		ctermfg=39 	 ctermbg=NONE cterm=NONE
hi String 			ctermfg=214  ctermbg=NONE cterm=NONE
hi Character 		ctermfg=214  ctermbg=NONE cterm=NONE
" Number
" Boolean
" Float

" any variable name 
hi Identifier 		ctermfg=121  ctermbg=NONE cterm=NONE
hi Function 		ctermfg=127  ctermbg=NONE cterm=NONE

" (such as: echo, grep, printf, exit, ;;, command...)
hi Statement	   ctermfg=127 ctermbg=NONE cterm=bold
" if, then, else, endif, switch, etc,
hi Conditional	   ctermfg=226 ctermbg=NONE cterm=NONE
" for, do, while, etc,(include <char> ?>
hi Repeat	   ctermfg=226 ctermbg=NONE cterm=NONE
" case, default, etc,
hi Label	   ctermfg=226 ctermbg=NONE cterm=NONE
" sizeof, +, *, etc,
hi Operator	   ctermfg=196 ctermbg=NONE cterm=NONE
"keyword of golang
hi Keyword	   ctermfg=199 ctermbg=NONE cterm=NONE
" try, catch, throw
hi Exception	   ctermfg=226 ctermbg=NONE cterm=NONE

" generic Preprocessor
"hi PreProc	   ctermfg=#E36660 ctermbg=NONE cterm=NONE
" preprocessor #include
" Include	ctermfg=#E36660 ctermbg=NONE cterm=NONE
" preprocessor #define
" Define	ctermfg=#E36660 ctermbg=NONE cterm=NONE
" same as Define
" Macro	ctermfg=#E36660 ctermbg=NONE cterm=NONE
" preprocessor #if, #else, #endif, etc,
" PreCondit	ctermfg=#E36660 ctermbg=NONE cterm=NONE

" int, long, char, etc,
hi Type		   ctermfg=199  ctermbg=NONE cterm=NONE
" static, register, volatile, etc, 
hi StorageClass	   ctermfg=196  ctermbg=NONE cterm=NONE
" struct, union, enum, etc, 
hi Structure	   ctermfg=199  ctermbg=NONE cterm=NONE
" A typedef
hi Typedef	   ctermfg=196  ctermbg=NONE cterm=NONE

" any special symbol(such as:markdown ### ```java...)
hi Special	   ctermfg=226 ctermbg=NONE cterm=NONE
" special character in a constant TODO
hi SpecialChar	   ctermfg=196 ctermbg=121 cterm=NONE"
" you can use CTRL-] on this
" Tag	ctermfg=#848326 ctermbg=NONE cterm=NONE""
" character that needs attention
" Delimiter	ctermfg=#848326 ctermbg=NONE cterm=NONE""
" special things inside a comment
" SpecialComment	ctermfg=#848326 ctermbg=NONE cterm=NONE""
" debugging statements
" Debug	ctermfg=#848326 ctermbg=NONE cterm=NONE""

" text that stands out, HTML links(such as: markdown[]())
hi Underlined	   ctermfg=39  ctermbg=NONE  cterm=underline

" left blank, hidden hl-Ignore TODO
hi Ignor	   ctermfg=196	ctermbg=121  cterm=underline

" any erroneous construct
hi Error	   ctermfg=15   ctermbg=196  cterm=bold

" anything that needs extra attention; mostly the keywords TODO FIXME and XXX
hi Todo		   ctermfg=232  ctermbg=226  cterm=bold



" Extended Highlighting (see :help highlight-default)
" ====================================================
" used for the columns set with 'colorcolumn' TODO
hi ColorColumn	   ctermfg=39   ctermbg=127  cterm=NONE
" placeholder characters substituted for concealed TODO
hi Conceal	   ctermfg=39	ctermbg=127  cterm=NONE
" the character under the cursor TODO
hi Cursor	   ctermfg=39	ctermbg=127  cterm=NONE
" the chracter under the cursor when 'language-mapping' is used TODO
hi lCursor	   ctermfg=39	ctermbg=127  cterm=NONE
" like cursor, but used when in IME mode 'cursorIM' TODO
hi CursorIM	   ctermfg=39	ctermbg=127  cterm=NONE
" the screen column that the cursor is in when 'cursorcolumn' is set TODO
hi CursorColumn	   ctermfg=39	ctermbg=127  cterm=NONE
" the screen line that the cursor is in when 'cursorline' is set(:set cursorline and right line
" block)
hi CursorLine	   ctermfg=NONE	ctermbg=NONE  cterm=underline
" directory names and other special names in listings head of vim-go error
hi Directory	   ctermfg=39	ctermbg=232  cterm=NONE

" diff mode: add line
"hi DiffAdd	   ctermfg=121  ctermbg=39 cterm=NONE
" diff mode: change line TODO
hi DiffChange   ctermfg=196  ctermbg=121 cterm=NONE
" diff mode: delete line
"hi DiffDelete	   ctermfg=192  ctermbg=192 cterm=NONE
" diff mode: change text within a changed line TODO
hi DiffText    ctermfg=196  ctermbg=121  cterm=NONE
"
"*.diff +
hi diffAdded   ctermfg=121  ctermbg=NONE cterm=NONE
"*.diff -
hi diffRemoved ctermfg=196  ctermbg=NONE cterm=NONE
"Function TODO
hi diffChanged ctermfg=196  ctermbg=121  cterm=NONE
"@@ -84,44 +84,49@@
hi diffLine    ctermfg=127  ctermbg=NONE cterm=NONE
"after diffline: static unsigned int tabspaces=8;
hi diffSubName ctermfg=226  ctermbg=NONE cterm=NONE

" filler lines (~) after the last line in the buffer. by default, this is highlighted like 'hl-nontext'
" (in the end of file , the line which have '~' )
hi EndOfBuffer	   ctermfg=248	ctermbg=NONE cterm=NONE
" error message on the command line
hi ErrorMsg	   ctermfg=15	ctermbg=196  cterm=bold
" the column separating vertically split windows(:vsp middle line)
hi VertSplit	   ctermfg=232 	ctermbg=253  cterm=NONE
" line used for closed folds TODO
hi Folded	   ctermfg=39	ctermbg=127  cterm=NONE
" 'foldcolumn' TODO
hi FoldColumn	   ctermfg=39	ctermbg=127  cterm=NONE
" column where 'signs' are displayed vim-ale-left-column
hi SignColumn	   ctermfg=39	ctermbg=NONE  cterm=BOLD
" 'incsearch' highlighting. also used for the text replaced with(use '/' to search) 
hi Incsearch	   ctermfg=232	ctermbg=121  cterm=BOLD

" line number for ":number" and ":#" commands(left number)
hi LineNr	   ctermfg=121	ctermbg=NONE cterm=NONE
" line number for when 'relativenumber' option is set, above the cursor line(left and above number)
hi LineNrAbove	   ctermfg=248	ctermbg=NONE  cterm=NONE
" line number for when 'relativenumber' option is set, below the cursor line(left and below number)
hi LineNrBelow	   ctermfg=248	ctermbg=NONE  cterm=NONE
" like lineNr when 'cursorline' is set and 'cursorlineopt' is set to 'number' or 'both', or 'relati
" venumber' is set, for the cursor line(:set cursorline and left line block)
hi CursorLineNr	   ctermfg=121	ctermbg=NONE  cterm=underline

" the character under the cursor or just before it, if it is a paired bracket , and its match
hi MatchParen	   ctermfg=226	ctermbg=248  cterm=BOLD
" 'showmode' message (e.g. --INSERT-- )
hi ModeMsg	   ctermfg=248	ctermbg=NONE cterm=NONE
" moremsg TODO
hi MoreMsg	   ctermfg=39	ctermbg=127  cterm=NONE
" '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text(e.g. ">" displayed when a double-wide character doesn't fit at the end of the line)(@@@ on the bottom)
hi NonText	   ctermfg=214	ctermbg=NONE cterm=NONE
" nomal text(normal mode)
hi Normal	   ctermfg=253	ctermbg=NONE cterm=NONE

" popup menu: normal item ctrl + p
hi Pmenu	   ctermfg=214  ctermbg=232 cterm=italic
" popup menu: selected item crl + p
hi PmenuSel	   ctermfg=232  ctermbg=214 cterm=BOLD
" popup menu: scrollbar ctrl + p
hi PmenuSbar	   ctermfg=39   ctermbg=232 cterm=NONE
" popup menu: thumb of the scrollbar ctrl + p
hi PmenuThumb	   ctermfg=39   ctermbg=248 cterm=NONE

" 'hit-enter' prompt and yes/no questions TODO
hi Question	   ctermfg=127	ctermbg=121  cterm=NONE
" current 'quickfix' item in the quickfix window vim-go-error
hi QuickFixLine	   ctermfg=196	ctermbg=NONE  cterm=NONE
" last search pattern highlighting(hlsearch). also used for similar items that need to stand out.
" like vim-go all same variate hilight
hi Search	   ctermfg=232	ctermbg=214  cterm=BOLD
" meta 	and special keys listed with ":map", also for text used. to show unprintable characters in
" the text, 'listchars'. Generally: text that is displayed dirrently from what is reallyis. TODO
hi SpecialKey	   ctermfg=127	ctermbg=121  cterm=NONE
" word that is not recognized by the spellchecker. this will be combined with the highlighting used
" otherwise(:set spell)
hi SpellBad	   ctermfg=15	ctermbg=196  cterm=BOLD
" word that should start with a capital. this will be combined with the hightlighting used otherwise
" (first letter of sentence)
hi SpellCap	   ctermfg=196	ctermbg=226  cterm=BOLD
" word that is recognized by the spellchecker as one that is. used in another region. this will be
" combined with the highlighting used otherwise.
hi SpellLocal	   ctermfg=127	ctermbg=121  cterm=NONE
" word that is recognized by the spell checker as one that is hardly ever used. TODO
hi SpellRare	   ctermfg=127	ctermbg=121  cterm=NONE

" status line of current window(bottom)
hi StatusLine	   ctermfg=232	ctermbg=253  cterm=NONE
" status lines of not-current windows. if this is equal to 'statusline' vim will use '^^^' in the
" status line of the current window.(other bottom)
hi StatusLineNC	   ctermfg=232	ctermbg=244  cterm=NONE
" status line of current window. if it is a 'terminal' window. command :term ...
hi StatusLineTerm  ctermfg=232	ctermbg=253  cterm=NONE
" status lines of not-current windows that is a 'terminal' window  command :term ...
hi StatusLineTermNC ctermfg=232	ctermbg=244  cterm=NONE
" statu line custom
hi User1 			ctermfg=196 ctermbg=NONE  cterm=BOLD
hi User2 			ctermfg=214 ctermbg=NONE  cterm=NONE
hi User3 			ctermfg=121 ctermbg=NONE  cterm=NONE
hi User4 			ctermfg=253 ctermbg=NONE  cterm=NONE
hi User5 			ctermfg=199 ctermbg=NONE  cterm=NONE
hi User6 			ctermfg=199 ctermbg=NONE  cterm=BOLD

" tab pages line, not ative tab page label TODO
hi TabLine	   ctermfg=127	ctermbg=121  cterm=NONE
" tab pages line, where there are no labels TODO
hi TabLineFill	   ctermfg=127	ctermbg=121  cterm=NONE
" tab pages line, active tab page label TODO
hi TabLineSel	   ctermfg=127	ctermbg=121  cterm=NONE
" 'terminal' window command :term ...
hi Terminal	   ctermfg=214	ctermbg=NONE  cterm=NONE
" titles for output from ':set all', ':autocmd' etc(such as: markdown ## xxx)
hi Title	   ctermfg=121	ctermbg=NONE cterm=NONE
" visual mode selection
hi Visual	   ctermfg=232	ctermbg=253  cterm=NONE
" visual mode selection when vim is 'not owning the selection'. only x11gui's 'gui-x1' and
" 'xterm-clipboard' supports this. TODO
hi VisualNOS	   ctermfg=127	ctermbg=121  cterm=NONE
" warning message
hi WarningMsg	   ctermfg=196	ctermbg=226  cterm=NONE
" current match in 'wildmenu' completion TODO
hi WildMenu	   ctermfg=127	ctermbg=121  cterm=NONE

" current font, background and foreground colors of the menus. also used for the toolbar. applicable
" highlight arguments: font, guibg, guifg. for motif and athna the font argument actually. specifies
" a fontset at all times, no matter if 'guifontset' is empty, and as such it is tied to the current
" 'language' when set
"Menu

" current font, background and foreground of the main window's scrollbars. applcable highlight
" arguments: guibg, guifg.
"Scrollbar

" current font, background and foreground of the applicable highlight arguments: font, guibg,guifg.
" for motif and athena the font argument actually. specifies a fontset at all times , no matter if
" 'guifontset' is empty, and as such it is tied to the current 'language' when set
"Tooltip



" Quickfix window highlighting
hi link qfLineNr Function
hi link qfError  Repeat
" qfFileName"


hi link yamlFlowMappingKey    Function
hi link yamlBlockMappingKey   Function
hi link yamlKeyValueDelimiter Operator
hi link dosiniLabel           Function
"hi rstHyperlinkTarget ctermfg=#608F76 ctermbg=NONE cterm=underline



" Vim Syntax Highlighting
" =======================
hi link vimVar            Identifier
hi link vimFunc           Function
hi link vimSetSep         Normal
hi link vimEnvvar         Type
hi link vimOption         Type
hi link vimCommand        Repeat
hi link vimUserFunc       Function
hi link vimHiAttrib       Constant
hi link vimFgBgAttrib     Constant
hi link helpHeadline      Repeat
hi link helpHyperTextJump Type
"hi helpURL            ctermfg=#608F76 ctermbg=NONE    cterm=underline
"hi helpExample        ctermfg=#806456 ctermbg=NONE    cterm=NONE
"hi helpCommand        ctermfg=#8A8A8A ctermbg=NONE    cterm=NONE
"hi helpHyperTextEntry ctermfg=#89A1DE ctermbg=#13181D cterm=NONE





" Markdown Syntax Highlighting
" ============================
"  https://github.com/plasticboy/vim-markdown
hi mkdURL       ctermfg=226 ctermbg=226 cterm=underline
hi mkdLinkDef   ctermfg=226 ctermbg=226 cterm=NONE
hi mkdLink      ctermfg=226 ctermbg=226 cterm=NONE
hi mkdDelimiter ctermfg=226 ctermbg=226 cterm=NONE
hi mkdListItem  ctermfg=226 ctermbg=226 cterm=NONE

hi markdownCode	            ctermfg=214 ctermbg=NONE cterm=NONE
hi markdownError            ctermfg=15  ctermbg=196  cterm=BOLD
hi markdownCodeBlock        ctermfg=214 ctermbg=NONE cterm=NONE
hi markdownHeadingDelimiter ctermfg=244 ctermbg=NONE cterm=NONE



" Shell Syntax Highlighting
" =============================
hi link shLoop           shConditional
hi link shShellVariables Type
hi link shFunction       Function



" HTML Syntax Highlighting
" ========================
"  https://github.com/othree/html5.vim
"hi htmlTag     ctermfg=#7E7779 ctermbg=NONE cterm=NONE
"hi htmlEndTag  ctermfg=#7E7779 ctermbg=NONE cterm=NONE
hi link htmlTagName     Repeat
hi link djangoVarBlock  Normal
hi link djangoTagBlock  Normal
hi link djangoStatement Constant
"    -htmlBold
"    - htmlBoldUnderline
"    - htmlBoldUnderlineItalic
"    - htmlUnderline
"    - htmlUnderlineItalic
"    - htmlItalic
"    - htmlTitle for titles
"    - htmlH1 - htmlH6 for headings
"


" JavaScript Syntax Highlighting
" ==============================
"  https://github.com/pangloss/vim-javascript
"  https://github.com/othree/javascript-libraries-syntax.vim
hi link jsStatement       pythonStatement
hi link jsFunction        jsStatement
hi link jsReturn          jsStatement
hi link jsFuncCall        Function
hi link jsonBraces        Operator
hi link jsDomElemAttrs    Operator
hi link jsDomElemFuncs    Function
hi link jsHtmlElemAttrs   Operator
hi link jsHtmlElemFuncs   Function
hi link jsCssStyles       Operator
hi link jsRegexpOr        SpecialChar
hi link jsRegexpCharClass SpecialChar



" CSS Syntax Highlighting
" =======================
"  https://github.com/hail2u/vim-css3-syntax
" hi lessClass
" hi LessVariable
hi cssFunctionName  ctermfg=127 ctermbg=NONE cterm=NONE



" XML Syntax Highlighting
" =============================
hi link xmlTag     Repeat
hi link xmlTagName xmlTag
hi link xmlEndTag  xmlTag




" vim-go
" =============
" use function
hi goFunctionCall 		ctermfg=127 ctermbg=NONE cterm=NONE
" function name 
"hi goFunction 			
" "string"
hi goString				ctermfg=214 ctermbg=NONE cterm=NONE
" i := 
hi goVarDefs 			ctermfg=121 ctermbg=NONE cterm=NONE
" i = 
hi goVarAssign 			ctermfg=253 ctermbg=NONE cterm=NONE
" name in tyep ... XXXX
hi goTypeName 			ctermfg=199 ctermbg=NONE cterm=NONE
" type
hi goTypeDecl 			ctermfg=199 ctermbg=NONE cterm=NONE
" Stucdent{}
hi goTypeConstructor 	ctermfg=199 ctermbg=NONE cterm=NONE
" strut in type name ....
hi goDeclType 			ctermfg=199 ctermbg=NONE cterm=NONE
hi goGenerateVariables 	ctermfg=121 ctermbg=121  cterm=underline
hi goGenerate 			ctermfg=121 ctermbg=121  cterm=underline
" "%t"
"hi link goEscapeC 				yellow_NONE_NONE
hi goEscapeX 			ctermfg=121 ctermbg=121  cterm=underline
hi goEscapeU 			ctermfg=121 ctermbg=121  cterm=underline
hi goEscapeBigU 		ctermfg=121 ctermbg=121  cterm=underline
hi goEscapeOctal 		ctermfg=121 ctermbg=121  cterm=underline
hi goEscapeError 		ctermfg=121 ctermbg=121  cterm=underline
" "%c %d"
"hi link goSpecialString 		yellow_NONE_NONE 
hi goStringGroup 		ctermfg=121 ctermbg=121  cterm=underline

" var
hi goVar 				ctermfg=121 ctermbg=NONE cterm=NONE
" const
hi goConst 				ctermfg=39 	ctermbg=NONE cterm=NONE
" spece in var xxx
"hi goSingleDecl 			ctermfg=121 ctermbg=121 cterm=underline
" 10
"hi goDecimalInt 	
hi goDecimalError 		ctermfg=121 ctermbg=121 cterm=underline
" 16
"hi goHexadecimalInt 	
hi goHexadecimalError 	ctermfg=121 ctermbg=121 cterm=underline
" 8
"hi goOctalInt 	
hi goOctalError 		ctermfg=121 ctermbg=121 cterm=underline
" 2
"hi goBinaryInt 	
hi goBinaryError 		ctermfg=121 ctermbg=121 cterm=underline
"hi Integer 			

"hi goFloat 				
hi goImaginary 			ctermfg=121 ctermbg=121 cterm=underline
hi goImaginaryFloat 	ctermfg=121 ctermbg=121 cterm=underline


" == * & + 
"hi goOperator 			
hi goPointerOperator 	ctermfg=121  ctermbg=NONE cterm=underline
"hi goPointerOperator 	
hi goVarArgs 			ctermfg=199  ctermbg=NONE cterm=NONE



" struct.property
hi goField 				ctermfg=253 ctermbg=NONE cterm=NONE



" append cap close complex copy delete imag len
" make new panic print println real recover
hi goBuiltins 			ctermfg=199 ctermbg=NONE cterm=NONE


" defer go goto return break continue fallthrough
hi goStatement 			ctermfg=226 ctermbg=NONE cterm=NONE


"import
hi goImport 			ctermfg=226 ctermbg=NONE cterm=NONE


" package
hi goPackage 			ctermfg=226 ctermbg=NONE cterm=NONE
"hi goPackageComment 	ctermfg=226 ctermbg=226 cterm=NONE


hi goStringGroup 			ctermfg=121 ctermbg=121 cterm=underline
hi goStringGroup 			ctermfg=121 ctermbg=121 cterm=underline
hi goStringGroup 			ctermfg=121 ctermbg=121 cterm=underline
hi goStringGroup 			ctermfg=121 ctermbg=121 cterm=underline
hi goStringGroup 			ctermfg=121 ctermbg=121 cterm=underline
hi goStringGroup 			ctermfg=121 ctermbg=121 cterm=underline










"hi goVariableName 			ctermfg=127 ctermbg=127 cterm=NONE
"hi goStruct 			ctermfg=127 ctermbg=127 cterm=NONE
"hi goType 			ctermfg=127 ctermbg=127 cterm=NONE
"hi goVariable 			ctermfg=127 ctermbg=127 cterm=NONE
"let g:go_highlight_types = 1
"let g:go_highlight_variable_assignments = 0
"let g:go_highlight_variable_declarations = 0
"let g:go_highlight_array_whitespace_error = 1
"let g:go_highlight_build_constraints = 1
"let g:go_highlight_chan_whitespace_error = 1
"let g:go_highlight_extra_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_format_strings = 1
"let g:go_highlight_generate_tags = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_space_tab_error = 1
"let g:go_highlight_string_spellcheck = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_trailing_whitespace_error = 1
"let g:go_doc_keywordprg_enabled = 0
"let g:go_term_mode = "vertical splist"
"let g:go_echo_go_info = 0
"let g:go_doc_popup_window = 1
"let g:go_def_mapping_enabled = 0
"let g:go_template_autocreate = 0
"let g:go_textobj_enabled = 0
"let g:go_auto_type_info = 1
"let g:go_def_mapping_enabled = 0





" ===============
" coc
" ==============
" ' ' before character
"hi Quote ctermfg=121 ctermbg=121 cterm=underline

" Markdown related~
"hi CocBold* for bold text.
"hi CocItalic* for italic text.
"hi CocUnderline* for underlined text.
"hi CocStrikeThrough* for strikethrough text, like usage of deprecated API.
"hi CocMarkdownCode* for inline code in markdown content.
"hi CocMarkdownHeader* for markdown header in floating window/popup.
"hi CocMarkdownLink* for markdown link text in floating window/popup.

" ===Diagnostics related~
"hi CocFadeOut* for faded out text, such as for highlighting unnecessary code.
" sign
hi   CocErrorSign              ctermfg=196   ctermbg=NONE   cterm=NONE
hi   CocWarningSign            ctermfg=226   ctermbg=NONE   cterm=NONE
hi   CocInfoSign               ctermfg=121   ctermbg=121    cterm=NONE
hi   CocHintSign 			   ctermfg=121   ctermbg=121    cterm=NONE
" specific content
hi   CocErrorHighlight         ctermfg=253   ctermbg=196   cterm=BOLD
hi   CocWarningHighlight       ctermfg=253   ctermbg=226   cterm=BOLD
hi   CocInfoHighlight          ctermfg=121   ctermbg=121    cterm=NONE
hi   CocHintHighlight          ctermfg=121   ctermbg=121    cterm=NONE
"hi CocDeprecatedHighlight* for deprecated code range, links to
" |CocStrikeThrough| by default.
"hi CocUnusedHighlight* for unnecessary code range, links to |CocFadeOut| by default.
" line
hi   CocErrorLine     ctermfg=NONE   ctermbg=NONE   cterm=NONE
hi   CocWarningLine   ctermfg=NONE   ctermbg=NONE   cterm=NONE
hi   CocInfoLine      ctermfg=121   ctermbg=121    cterm=NONE
hi   CocHintLine      ctermfg=121   ctermbg=121    cterm=NONE

" ===Document highlight related~
"Highlights used for highlighting same symbols in the buffer at the current cursor position.
"hi *CocHighlightText* default symbol highlight.
"hi *CocHighlightRead* for `Read` kind of document symbol.
"hi *CocHighlightWrite* for `Write` kind of document symbol.

" ===Float window/popup related~
"hi CocFloating ctermfg=121 ctermbg=121 cterm=NONE
" Default link to |NormalFloat| on neovim and|`Pmenu| on vim.
hi CocErrorFloat   ctermfg=196 ctermbg=232 cterm=NONE
hi CocWarningFloat ctermfg=226 ctermbg=232 cterm=NONE
hi CocInfoFloat ctermfg=121 ctermbg=121 cterm=NONE
hi CocHintFloat ctermfg=121 ctermbg=121 cterm=NONE

" ===List related~
"hi CocSelectedText* for sign text of selected lines.
"hi CocSelectedLine* for line highlight of selected lines.
"hi CocListMode* for mode in statusline of CocList.
"hi CocListPath* for current cwd in statusline of CocList.

" ===Tree view related~
"hi CocTreeTitle* for title in tree view.
"hi CocTreeDescription* for description beside label.
"hi CocTreeOpenClose* for open and close icon in tree view.
"hi CocTreeSelected* for highlight lines contains selected node.

" ===Symbol icons~
"Highlight groups for symbol icons, including:
"hi CocSymbolFile  
"hi CocSymbolModule  
"hi CocSymbolNamespace  
"hi CocSymbolPackage  
"hi CocSymbolClass  
hi CocSymbolMethod  ctermfg=121 ctermbg=121 cterm=NONE
"hi CocSymbolProperty  
"hi CocSymbolField  
"hi CocSymbolConstructor  
"hi CocSymbolEnum  
"hi CocSymbolInterface  
"hi CocSymbolFunction  ctermfg=121 ctermbg=121 cterm=NONE
"hi CocSymbolVariable ctermfg=121 ctermbg=121 cterm=NONE 
"hi CocSymbolConstant  ctermfg=121 ctermbg=121 cterm=NONE
"hi CocSymbolString  
"hi CocSymbolNumber  
"hi CocSymbolBoolean  
"hi CocSymbolArray  ctermfg=121 ctermbg=121 cterm=NONE
"hi CocSymbolObject  
"hi CocSymbolKey  
"hi CocSymbolNull  
"hi CocSymbolEnumMember  
"hi CocSymbolStruct  
"hi CocSymbolEvent  
"hi CocSymbolOperator  
"hi CocSymbolTypeParameter  
"hi CocSymbolDefault  
" Note: Use configuration `suggest.completionItemKindLabels` for customized icon characters.

" ===Others~
"CocCodeLens* for virtual text of codeLens.
"CocCursorRange* for ranges of activated cursors.
"CocHoverRange* for range of current hovered symbol.
"CocMenuSel* for current menu item in menu dialog, works on neovim only since
"vim doesn't support change highlight group of cursorline inside popup.
"CocSelectedRange* for highlight ranges of outgoing calls.

" grammer for language
"hi link CocSem_namespace Identifier
"hi link CocSem_type Type
"hi link CocSem_class Structure
"hi link CocSem_enum Type
"hi link CocSem_interface Type
"hi link CocSem_struct Structure
"hi link CocSem_typeParameter Type
"hi link CocSem_parameter Identifier
"hi link CocSem_variable Identifier
hi CocSem_variable  ctermfg=121 ctermbg=121 cterm=NONE
hi default link CocSem_variable Error
"hi link CocSem_property Identifier
"hi link CocSem_enumMember Constant
"hi link CocSem_event Identifier
"hi link CocSem_function Function
"hi link CocSem_method Function
"hi link CocSem_macro Macro
"hi link CocSem_keyword Keyword
"hi link CocSem_modifier StorageClass
"hi link CocSem_comment Comment
hi CocSem_comment  ctermfg=121 ctermbg=121 cterm=NONE
"hi link CocSem_string String
"hi link CocSem_number Number
"hi link CocSem_regexp Normal
"hi link CocSem_operator Operator
