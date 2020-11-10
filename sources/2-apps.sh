#!/bin/bash -e

pinfo "Installing Required Packages"
brew bundle --file=- <<EOF
    tap "homebrew/bundle"
    tap "homebrew/core"
    tap "homebrew/cask-versions" # Alternate versions of software
    #tap "caskroom/fonts"    # Powerline fonts

    # Backup
    cask 'resilio-sync'
    cask 'google-backup-and-sync'
    brew 'mackup'         # App configuration service

    # Shell Stuff
    brew 'lastpass-cli'   # Accessing secrets
    brew 'zsh'            # Not bash

    brew 'coreutils'      # All those cool GNU things
    brew 'git'            # Collaborating
    brew 'tree'           #
    brew 'rename'         # Sometimes you just gotta change a whole bunch of files
    brew 'watch'          # Who watches the watchmen
    brew 'curl'           # To access things off the "World Wide Web"
    brew 'nmap'           # Are you there?
    brew 'wget'           # When cURL just won't do
    brew 'tldr'           # Quick lookup of stuff
    brew 'jq'             # to work with json from the terminal
    brew 'htop'
    brew 'sshuttle'
    brew 'telnet'

    # Communication
    cask 'whatsapp'       # To see everyone's group chats
    cask 'discord'        # To chat while gaming

    # Editors
    cask 'visual-studio-code' # Best quick editor

    # Development
    cask 'docker'          # Doing things in containers
    cask 'virtualbox'      # Doing things in VMs
    brew 'kubernetes-cli'  # Kubernetes
    brew 'kubernetes-helm' # Kubernetes
    cask 'kubernetic'      # Kubernetes
    cask 'gas-mask'        # manage hosts files
    cask 'jetbrains-toolbox'
    cask 'postman'         # RESTful calls
    cask 'balenaetcher'          # For restoring usb flash images
    cask 'tunnelblick'
    brew 'jsonnet'         # Making JSON easier??
    brew 'node'
    brew 'nvm'
    brew 'yarn'
    brew 'go'
    brew 'helmfile'
    brew 'google-cloud-sdk'

    # Productivity
    cask 'iterm2'          # Doing things on a terminal
    cask 'vlc'             # Watching movies
    cask 'google-chrome'   # Browsing the web
    cask 'firefox'         # Browsing the web
    brew 'screen'          # Just in case
    cask 'appcleaner'      # Help removing stuff
    cask 'flux'           # Sleep better

    # Gaming
    cask 'steam'          # So I can play games

    # Pretty
    cask 'aerial' # best screensaver

    # Apple Store Apps
    brew 'mas'
    mas 'Magnet', id: 441258766
    mas 'Microsoft Remote Desktop', id: 1295203466
EOF

brew cleanup

mkdir ~/.nvm
