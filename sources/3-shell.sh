#!/bin/bash -e

if [ ! -d ~/.zprezto ]; then
    pinfo "Installing Prezto"
    pushd .
    cd ~
    git clone --recursive https://github.com/sorin-ionescu/prezto.git .zprezto
    popd
    chsh -s /bin/zsh
else
    pnotice "Prezto already installed"
fi
