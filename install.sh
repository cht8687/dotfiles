!/bin/bash

sudo apt install git
sudo apt install npm
sudo npm install diff-so-fancy -g 
sudo apt install neovim

cp init.vim ~/.config/nvim/

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c 'PluginInstall' -c 'qa!'

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

sudo apt-get install silversearcher-ag

sudo apt-get install tmux

sudo apt install tmuxinator 

sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

# fix warnings
vim -c 'UpdateRemotePlugins' -c 'qa!'


