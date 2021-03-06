#!/bin/bash

cd ~/.vim_runtime

echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry' > ~/.vimrc

# init tmux
mv ~/.tmux.conf ~/.tmux.conf_back
cp .tmux.conf ~/.tmux.conf
cp .agignore ~/.agignore.conf

# compile vimproc
cd ~/.vim_runtime/sources_non_forked/vimproc.vim/
make

# install silversearcher
#sudo apt-get install silversearcher-ag

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
