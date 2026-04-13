#!/bin/bash -e

pinfo "Installing Required Packages"
brew bundle --file=- <<EOF
    tap "fluxcd/tap" # fpr flux the gitops engine
    tap "homebrew/command-not-found" # https://github.com/Homebrew/homebrew-command-not-found when a command is not found, search brew for the formula
    tap "rs/tap"

    # Backup
    cask 'resilio-sync'
    brew 'mackup'         # App configuration service

    # Shell Stuff
    brew 'bash'           # macos version is different
    brew 'zsh'            # Not bash
    brew 'fzf'
    brew 'fd'
    brew 'ripgrep'
    brew 'bat'

    # Generally useful things
    brew 'coreutils'      # All those cool GNU things
    brew 'git'            # Collaborating
    brew 'rename'         # Sometimes you just gotta change a whole bunch of files
    brew 'watch'          # Who watches the watchmen
    brew 'curl'           # To access things off the "World Wide Web"
    brew 'nmap'           # Are you there?
    brew 'wget'           # When cURL just won't do
    brew 'jq'             # to work with json from the terminal
    brew 'htop'           # Better than top
    brew 'btop'           # Even better than htop
    brew 'sshuttle'       # Phone home
    brew 'telnet'         # Handy sometimes
    brew "rs/tap/jaggr"   # Json aggregator
    brew "rs/tap/jplot"   # Json plotter

    # Communication
    cask 'whatsapp'       # To see everyone's group chats
    brew 'android-messages' # texting from the laptop!

    # Editors
    cask 'visual-studio-code' # Best quick editor
    cask 'obsidian'       # Knowledge base

    # Development
    cask 'podman-desktop' # Container manager
    brew 'podman'
    brew 'kubernetes-cli'  # Kubernetes
    brew 'helm'           # Helm: the package manager for k8s
    brew "kubectx"       # change context easier
    brew "kustomize"       # kubernetes yaml helper
    brew 'fluxcd/tap/flux' # GitOps engine
    brew 'k8sgpt'         # AI for k8s
    brew 'kubeseal'       # Sealed secrets
    cask 'gas-mask'        # manage hosts files
    cask 'jetbrains-toolbox' # Develop with pleasure
    cask 'postman'         # RESTful calls
    brew 'vegeta'          # Its over 9000!!!!!! Load testing tool
    brew 'nvm'             # Javascript
    brew 'pnpm'            # Javascript deps
    brew 'yarn'            # Javascript deps
    brew 'go'              # Not Javascript also Not c++ :)
    brew 'go-task'         # Task runner
    brew 'golangci-lint'   # Go linting
    brew 'python@3.12'     # Python
    brew 'pyenv'           # Python versions
    brew 'pipx'            # Python apps
    brew 'terraform'       # IaC
    brew 'pulumi'          # IaC
    brew 'ollama'          # Local LLMs
    brew 'gh'              # GitHub CLI
    brew 'glab'            # GitLab CLI
    brew 'gitup'           # Git helper
    cask 'google-cloud-sdk' # google
    brew 'awscli'           # aws

    # Productivity
    cask 'google-chrome'   # Browsing the web
    cask 'firefox'         # Browsing the web
    cask "microsoft-edge"  # Browsing the web
    brew 'screen'          # Just in case
    cask "the-unarchiver"  # Uncompress anything
    cask 'appcleaner'      # Uninstall cleaner
    cask 'freelens'        # Lens for mac
    cask 'tabby'           # Terminal emulator

    # Design
    cask 'gimp'            # Image editor

    # Gaming
    # cask 'steam'          # So I can play games

    # Apple Store Apps
    brew 'mas'
    mas 'Magnet', id: 441258766
    mas 'Microsoft Remote Desktop', id: 1295203466
    mas 'Sequel Ace', id: 1518036000
    mas 'Bitwarden', id: 1352778147
EOF

brew cleanup

# NVM requires this directory
mkdir ~/.nvm
