#!/bin/bash

mkdir -p ~/.config/nvim/

git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim

ln -s $PWD/.tmux.conf ~/.tmux.conf
ln -s $PWD/init.nvim ~/.config/nvim/init.nvim
