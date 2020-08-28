#!/bin/bash

BACKUP_DIR=~/.bak
NVIM_BUNDLE_DIR=~/.config/nvim/bundle
VIM_BUNDLE_DIR=~/.vim/bundle

NVIM_CONF=~/.config/nvim/init.nvim
VIM_CONF=~/.vimrc
TMUX_CONF=~/.tmux.conf
BASH_ALIASES=~/.bash_aliases

Install()
{
    # Setup .tmux.conf
    InstallFile $TMUX_CONF $PWD/tmux.conf

    # Setup .bash_aliases
    InstallFile $BASH_ALIASES $PWD/aliases

    # Setup Neovim
    mkdir -p $NVIM_BUNDLE_DIR
    InstallFile $NVIM_CONF $PWD/nvim.conf
    InstallBundle $NVIM_BUNDLE_DIR /Vundle.vim $PWD/bundle

    # Setup Vim
    mkdir -p $VIM_BUNDLE_DIR
    InstallFile $VIM_CONF $PWD/nvim.conf
    InstallBundle $VIM_BUNDLE_DIR /Vundle.vim $PWD/bundle
}

InstallBundle()
{
    if [[ -L $1$2 ]]; then
        rm -rf $1$2
    elif [[ -d $1$2 ]]; then
        mkdir -p $BACKUP_DIR
        mv $1$2 $BACKUP_DIR
    fi

    ln -s $3$2 $1
}

InstallFile()
{
    if [[ -L $1 ]]; then
        rm $1
    elif [[ -f $1 ]]; then
        mkdir -p $BACKUP_DIR
        mv $1 $BACKUP_DIR
    fi

    ln -s $2 $1
}

Install
