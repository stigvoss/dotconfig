#!/bin/bash

BACKUP_DIR=~/.bak
NVIM_BUNDLE_DIR=~/.config/nvim/bundle
VIM_BUNDLE_DIR=~/.vim/bundle

NVIM_CONF=~/.config/nvim/init.nvim
VIM_CONF=~/.vimrc
TMUX_CONF=~/.tmux.conf
BASH_ALIASES=~/.bash_aliases

mkdir -p $BACKUP_DIR

if [[ -L $TMUX_CONF ]]; then
    rm $TMUX_CONF
elif [[ -f $TMUX_CONF ]]; then
    mv $TMUX_CONF $BACKUP_DIR
fi

ln -s $PWD/.tmux.conf $TMUX_CONF

if [[ -L $BASH_ALIASES ]]; then
    rm $BASH_ALIASES
elif [[ -f $BASH_ALIASES ]]; then
    mv $BASH_ALIASES $BACKUP_DIR
fi

ln -s $PWD/.bash_aliases $BASH_ALIASES

# Setup Neovim
mkdir -p $NVIM_BUNDLE_DIR

if [[ -L $NVIM_CONF ]]; then
    rm $NVIM_CONF
elif [[ -f $NVIM_CONF ]]; then
    mv $NVIM_CONF $BACKUP_DIR
fi

if [[ -L $NVIM_BUNDLE_DIR/Vundle.vim ]]; then
    rm -rf $NVIM_BUNDLE_DIR/Vundle.vim
elif [[ -d $NVIM_BUNDLE_DIR/Vundle.vim ]]; then
    mv $NVIM_BUNDLE_DIR/Vundle.vim $BACKUP_DIR
fi

ln -s $PWD/init.nvim $NVIM_CONF
ln -s $PWD/bundle/Vundle.vim/ $NVIM_BUNDLE_DIR

# Setup Vim
mkdir -p $VIM_BUNDLE_DIR

if [[ -L $VIM_CONF ]]; then
    rm $VIM_CONF
elif [[ -f $VIM_CONF ]]; then
    mv $VIM_CONF $BACKUP_DIR
fi

if [[ -L $VIM_BUNDLE_DIR/Vundle.vim ]]; then
    rm -rf $VIM_BUNDLE_DIR/Vundle.vim
elif [[ -d $VIM_BUNDLE_DIR/Vundle.vim ]]; then
    mv $VIM_BUNDLE_DIR/Vundle.vim $BACKUP_DIR
fi

ln -s $PWD/init.nvim $VIM_CONF
ln -s $PWD/bundle/Vundle.vim/ $VIM_BUNDLE_DIR
