#!/bin/bash -e

pinfo "Installing Required Packages"
brew bundle --file=- <<EOF
    # tap "homebrew/aliases"
    # tap "homebrew/autoupdate"
    # tap "homebrew/bundle"
    # tap "homebrew/cask"
    # tap "homebrew/cask-versions"
    # tap "homebrew/core"
    # tap "homebrew/services"
    tap "fluxcd/tap" # fpr flux the gitops engine
    tap "tomanthony/brews" # tap fpr itermocil
    tap "homebrew/command-not-found" # https://github.com/Homebrew/homebrew-command-not-found when a command is not found, search brew for the formula
    tap "rs/tap"

    # Backup
    cask 'resilio-sync'
    cask 'google-backup-and-sync'
    brew 'mackup'         # App configuration service

    # Shell Stuff
    cask 'iterm2'         # Doing things on a terminal
    brew 'bash'           # macos version is different
    brew 'zsh'            # Not bash
    brew 'TomAnthony/brews/itermocil' # iTerm2 layouts

    # Generally useful things
    brew 'coreutils'      # All those cool GNU things
    brew 'git'            # Collaborating
    brew 'rename'         # Sometimes you just gotta change a whole bunch of files
    brew 'watch'          # Who watches the watchmen
    brew 'curl'           # To access things off the "World Wide Web"
    brew 'nmap'           # Are you there?
    brew 'wget'           # When cURL just won't do
    brew 'tldr'           # Quick lookup of stuff
    brew 'jq'             # to work with json from the terminal
    brew 'htop'           # Better than top
    brew 'sshuttle'       # Phone home
    brew 'telnet'         # Handy sometimes
    brew "rs/tap/jaggr"   # Json aggregator
    brew "rs/tap/jplot"   # Json plotter

    # Communication
    cask 'whatsapp'       # To see everyone's group chats
    cask 'discord'        # To chat while gaming

    # Editors
    cask 'visual-studio-code' # Best quick editor

    # Development
    cask 'docker'          # Doing things in containers
    cask 'virtualbox'      # Doing things in VMs
    brew 'kubernetes-cli'  # Kubernetes
    brew 'kubernetes-helm' # Helm: the package manager for k8s
    brew "kubectx"         # change context easier
    brew "kustomize"       # kubernetes yaml helper
    brew 'helmfile'        # Kubernetes helm automation
    brew 'fluxcd/tap/flux' # GitOps engine
    cask 'octant'          # Kubernetes dashboard
    cask 'gas-mask'        # manage hosts files
    cask 'jetbrains-toolbox' # Develop with pleasure
    cask 'postman'         # RESTful calls
    brew 'vegeta'          # Its over 9000!!!!!! Load testing tool
    cask 'balenaetcher'    # For making usb flash from images
    cask 'tunnelblick'     # Client for OpenVPN
    brew 'node'            # Javascript!
    brew 'nvm'             # Javascript Versions
    brew 'yarn'            # Javascript deps
    brew 'go'              # Not Javascript also Not c++ :)
    brew "nginx"           # Reverse proxy
    
    # The CLOUUUUD!!!
    brew 'google-cloud-sdk' # google
    brew 'awscli'           # aws

    # Productivity
    cask 'vlc'             # Watching movies
    cask 'google-chrome'   # Browsing the web
    cask 'firefox'         # Browsing the web
    cask "microsoft-edge"  # Browsing the web
    brew 'screen'          # Just in case
    cask 'appcleaner'      # Help removing stuff
    cask "recordit"        # Screen recordings
    cask "the-unarchiver"  # Uncompress anything

    # Gaming
    cask 'steam'          # So I can play games

    # Pretty
    cask 'aerial' # best screensaver

    # Apple Store Apps
    brew 'mas'
    mas 'Magnet', id: 441258766
    mas 'Microsoft Remote Desktop', id: 1295203466
    mas "Sequel Ace", id: 1518036000
EOF

brew cleanup

# NVM requires this directory
mkdir ~/.nvm
