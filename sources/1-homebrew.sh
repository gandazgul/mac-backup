#!/bin/bash -e

pinfo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

pnotice "Verifying the Homebrew installation"
brew doctor
