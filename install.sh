#!/bin/bash

ln -s $PWD/.tmux.conf ~/.tmux.conf

# Setup Neovim
mkdir -p ~/.config/nvim/bundle/
ln -s $PWD/init.nvim ~/.config/nvim/init.nvim
ln -s $PWD/bundle/Vundle.vim/ ~/.config/nvim/bundle/Vundle.vim/

# Setup Vim
mkdir -p ~/.vim/bundle/
ln -s $PWD/bundle/Vundle.vim/ ~/.vim/bundle/Vundle.vim/
