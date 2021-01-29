#!/usr/bin/env bash

# Check for .vim
[ ! -d "~/.vim" ] && mkdir ~/.vim

rm -fv ~/.bashrc
rm -fv ~/.gitconfig
rm -fv ~/.gitignore
rm -fv ~/.inputrc
rm -fv ~/.profile
rm -fv ~/.tmux.conf
rm -fv ~/.vimrc

# Remove current .vim and pull custom
rm -rf ~/.vim/
cp -R ~/etc/vim ~/.vim

ln -vs ~/etc/bashrc ~/.bashrc
ln -vs ~/etc/gitconfig ~/.gitconfig
ln -vs ~/etc/gitignore ~/.gitignore
ln -vs ~/etc/inputrc ~/.inputrc
ln -vs ~/etc/profile ~/.profile
ln -vs ~/etc/tmux.conf ~/.tmux.conf
ln -vs ~/etc/vimrc ~/.vimrc
