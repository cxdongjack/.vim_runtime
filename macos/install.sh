#!/bin/bash

mv ~/.bash_profile ~/.bash_profile_back
mv ~/.gitconfig ~/.gitconfig_back
mv ~/.gitignore ~/.gitignore_back

cd ~
ln -s .vim_runtime/macos/bash_profile .bash_profile
ln -s .vim_runtime/macos/gitconfig .gitconfig
ln -s .vim_runtime/macos/gitignore .gitignore 
