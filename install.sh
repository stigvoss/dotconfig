#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

BACKUP_DIR=~/.bak

Install()
{
    # Setup .bash_aliases
    InstallFile ~/.bash_aliases $PWD/aliases

    # Setup Vim
    mkdir -p ~/.vim/bundle
    InstallFile ~/.vimrc $PWD/nvim.conf
    InstallBundle ~/.vim/bundle /Vundle.vim $PWD/bundle

    if [[ -x "$(command -v neovim)" ]]; then
        # Setup Neovim
        mkdir -p ~/.config/nvim/bundle
        InstallFile ~/.config/nvim/init.nvim $PWD/nvim.conf
        InstallBundle ~/.config/nvim/bundle /Vundle.vim $PWD/bundle
    fi

    if [[ -x "$(command -v i3)" ]]; then
        # Setup i3
        mkdir -p ~/.config/i3
        InstallFile ~/.config/i3/config $PWD/i3.conf
    fi

    if [[ -x "$(command -v tmux)" ]]; then
        # Setup .tmux.conf
        InstallFile ~/.tmux.conf $PWD/tmux.conf
    fi
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
