#!/bin/bash
# 
 
mv ~/.vim/plugged/vim-go/gosnippets ~/.vim/plugged/vim-go/del_gosnippets
mkdir ~/.vim/plugged/
cd ~/.vim/plugged/
git clone https://github.com/airblade/vim-gitgutter.git
