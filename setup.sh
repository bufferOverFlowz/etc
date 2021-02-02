#!/usr/bin/env bash

# Check for snippet dir if found add custom snippets
[[ -d ~/.vim/plugged/vim-snippets ]] && \
    cp -rf ~/etc/vim/snippets/* ~/.vim/plugged/vim-snippets/snippets/

rm -fv ~/.bashrc
rm -fv ~/.gitconfig
rm -fv ~/.gitignore
rm -fv ~/.inputrc
rm -fv ~/.profile
rm -fv ~/.tmux.conf
rm -fv ~/.vimrc

# Link etc confs with ~
ln -vs ~/etc/bashrc ~/.bashrc
ln -vs ~/etc/gitconfig ~/.gitconfig
ln -vs ~/etc/gitignore ~/.gitignore
ln -vs ~/etc/inputrc ~/.inputrc
ln -vs ~/etc/profile ~/.profile
ln -vs ~/etc/tmux.conf ~/.tmux.conf
ln -vs ~/etc/vimrc ~/.vimrc
