#!/bin/bash -e

pinfo "Installing Required Packages"
brew bundle --file=- <<EOF
    tap "homebrew/bundle"
    tap "homebrew/core"
    tap "caskroom/versions" # Alternate versions of software
    #tap "caskroom/fonts"    # Powerline fonts

    # Backup
    cask 'resilio-sync'
    cask 'google-backup-and-sync'
    brew 'mackup'         # App configuration service

    # Shell Stuff
    brew 'lastpass-cli'   # Accessing secrets
    brew 'zsh'            # Not bash

    #brew 'coreutils'      # All those cool GNU things
    brew 'git'            # Collaborating
    brew 'tree'           #
    brew 'rename'         # Sometimes you just gotta change a whole bunch of files
    brew 'watch'          # Who watches the watchmen
    brew 'curl'           # To access things off the "World Wide Web"
    #brew 'nmap'           # Are you there?
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
    # brew 'nano'
    # brew 'vim'            # When you really need it

    # Development
    cask 'docker'          # Doing things in containers
    cask 'virtualbox'      # Doing things in VMs
    #brew 'hub'            # Github CLI and shortcuts
    brew 'kubernetes-cli'  # Kubernetes
    brew 'kubernetes-helm' # Kubernetes
    cask 'kubernetic'      # Kubernetes
    cask 'gas-mask'        # manage hosts files
    cask 'jetbrains-toolbox'
    cask 'postman'         # RESTful calls
    cask 'etcher'          # For restoring usb flash images
    cask 'tunnelblick'
    brew 'jsonnet'         # Making JSON easier??
    brew 'node'
    brew 'yarn'
    brew 'go'

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

    # Apple Store Apps
    brew 'mas'
    mas 'Magnet', id: 441258766
    mas 'Microsoft Remote Desktop 10', id: 1295203466
EOF

brew cleanup
brew cask cleanup
brew prune

pinfo "Installing Helmfile"
curl -sL https://api.github.com/repos/roboll/helmfile/releases/latest | jq -r '.assets[].browser_download_url' | grep darwin_amd64 | wget -qi -
chmod +x helmfile_darwin_amd64
mv helmfile_darwin_amd64 /usr/local/bin/helmfile
