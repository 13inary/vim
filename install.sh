#!/bin/bash

# vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# neovim
#sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       #https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
curl -fLo ~/.vim/UltiSnips/go.snippets --create-dirs \
    https://raw.githubusercontent.com/keysquivered/vim/master/UltiSnips/go.snippets
curl -fLo ~/.vim/vimConfig --create-dirs \
    https://raw.githubusercontent.com/keysquivered/vim/master/vimConfig
curl -fLo ~/.vim/coc-settings.json --create-dirs \
    https://raw.githubusercontent.com/keysquivered/vim/master/coc-settings.json
