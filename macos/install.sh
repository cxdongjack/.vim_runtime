mv ~/.bash_profile ~/.bash_profile_back
mv ~/.gitconfig ~/.gitconfig_back

# config default editor
git config --global core.editor vim

cd ~
ln -s .vim_runtime/macos/bash_profile .bash_profile
ln -s .vim_runtime/macos/gitconfig .gitconfig
