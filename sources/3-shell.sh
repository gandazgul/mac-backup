#!/bin/bash -e

if [ ! -d ~/.zprezto ]; then
    pinfo "Installing Prezto"
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "~/.zprezto"
    chsh -s /bin/zsh
else
    pnotice "Prezto already installed"
fi
