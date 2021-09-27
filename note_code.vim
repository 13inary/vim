" =======================================
" Filw: custom vim colorscheme
" Description: suitable for cterm
" Author:
" Repository: https://github.com/keysquivered/
" =======================================



" help
" ====
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
let myYellow		=   226
" 172 214
let myOrange		=   214
" 160 9 196
let myRed		=   196

" 199 162
let myPink		=   199
" 127~129
let myPurple		=   127



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
hi Comment	   ctermfg=248 ctermbg=NONE cterm=NONE

hi Constant	   ctermfg=39  ctermbg=NONE cterm=NONE
hi String	   ctermfg=214 ctermbg=NONE cterm=NONE
hi Character	   ctermfg=214 ctermbg=NONE cterm=NONE
" Number
" Boolean
" Float

" any variable name 
hi Identifier	   ctermfg=121 ctermbg=NONE cterm=NONE
hi Function	   ctermfg=127 ctermbg=NONE cterm=NONE

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
"TODO
hi Keyword	   ctermfg=196 ctermbg=121  cterm=bold
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
" directory names and other special names in listings TODO
hi Directory	   ctermfg=39	ctermbg=127  cterm=NONE

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
" column where 'signs' are displayed TODO
hi SignColumn	   ctermfg=39	ctermbg=127  cterm=NONE
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

" popup menu: normal item
"hi Pmenu	   ctermfg=#947D72 ctermbg=#292621 cterm=NONE
" popup menu: selected item
"hi PmenuSel	   ctermfg=#96A6CF ctermbg=#252B2F cterm=NONE
" popup menu: scrollbar
"hi PmenuSbar	   ctermfg=NONE    ctermbg=#232019 cterm=NONE
" popup menu: thumb of the scrollbar
"hi PmenuThumb	   ctermfg=NONE    ctermbg=#283238 cterm=NONE

" 'hit-enter' prompt and yes/no questions TODO
hi Question	   ctermfg=127	ctermbg=121  cterm=NONE
" current 'quickfix' item in the quickfix window TODO
hi QuickFixLine	   ctermfg=127	ctermbg=121  cterm=NONE
" last search pattern highlighting(hlsearch). also used for similar items that need to stand out.
" TODO
hi Search	   ctermfg=127	ctermbg=121  cterm=NONE
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
" status line of current window. if it is a 'terminal' window. TODO
hi StatusLineTerm  ctermfg=127	ctermbg=121  cterm=NONE
" status lines of not-current windows that is a 'terminal' window TODO
hi StatusLineTermNC ctermfg=127	ctermbg=121  cterm=NONE

" tab pages line, not ative tab page label TODO
hi TabLine	   ctermfg=127	ctermbg=121  cterm=NONE
" tab pages line, where there are no labels TODO
hi TabLineFill	   ctermfg=127	ctermbg=121  cterm=NONE
" tab pages line, active tab page label TODO
hi TabLineSel	   ctermfg=127	ctermbg=121  cterm=NONE
" 'terminal' window TODO
hi Terminal	   ctermfg=127	ctermbg=121  cterm=NONE
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
