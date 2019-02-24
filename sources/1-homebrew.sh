#!/bin/bash -e

if command -v brew 2> /dev/null; then
    pnotice "Homebrew is already installed updating"
    brew update
else
    pinfo "Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

pnotice "Verifying the Homebrew installation"
brew doctor
