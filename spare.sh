#!/usr/bin/env bash

cp ~/.vimrc .
cp ~/.bash_profile .
cp ~/.bashrc .
cp ~/.aliases .
cp ~/.zshrc .
cp ~/.tmux.conf .
cp -r ~/.tmuxinator/ ./.tmuxinator/
cp -r ~/.config/nvim .
rm -rf Brewfile
brew bundle dump

sudo cp -r ~/.vim .

