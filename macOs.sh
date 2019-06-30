brew bundle

cp init.vim ~/.config/nvim/

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c 'PluginInstall' -c 'qa!'


git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install


#if any error with python3 execute following
#pip3 install --upgrade --force-reinstall neovim
#vim -c 'UpdateRemotePlugins' -c 'qa!'
