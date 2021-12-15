" =================
" vim plug manager
" =================
" vimawesome.com
" install nodejs npm yarn
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', {'for':'go'}
"Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'for':['go','vim'], 'branch':'release'}
Plug 'jiangmiao/auto-pairs', {'for':['go','vim','markdown','json']}
"Plug 'junegunn/fzf.vim'
"Plug 'ianva/vim-youdao-translater'
Plug 'scrooloose/nerdtree', {'for':'go'}
Plug 'SirVer/ultisnips', {'for':'go'}
Plug 'honza/vim-snippets', {'for':'go'}
Plug 'godlygeek/tabular'
"Plug 'scrooloose/nerdtree' , {'on': 'NERDTreeToggle'}
"Plug 'iamcco/markdown-preview.nvim'
"Plug 'vim-table-mode'
"Plug 'vim-signiture'
call plug#end()
" PlugInstall
