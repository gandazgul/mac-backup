#!/bin/bash -e

pinfo "Installing Prezto"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "~/.zprezto"
chsh -s /bin/zsh
