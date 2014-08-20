#!/usr/bin/env bash

git pull origin master;

function doIt() {
    DF=`pwd`;
    ln -svf $DF $HOME/.dotfiles;
    ln -svf $DF/bash_profile $HOME/.bash_profile;
    ln -svf $DF/bash_prompt $HOME/.bash_prompt;
    ln -svf $DF/bashrc $HOME/.bashrc;
    ln -svf $DF/inputrc $HOME/.inputrc;
    ln -svf $DF/exports $HOME/.exports;
    ln -svf $DF/aliases $HOME/.aliases;
    ln -svf $DF/functions $HOME/.functions;
    ln -svf $DF/gitconfig $HOME/.gitconfig;
    ln -svf $DF/gitignore $HOME/.gitignore;
    source $HOME/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;
unset doIt;
