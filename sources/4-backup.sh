#!/bin/bash -e

pwarn "Please setup Resilio Sync and start syncing"
open /Applications/Resilio\ Sync.app

prompt

pinfo "Restoring Mackup Configuration"
if [ ! -f ~/.mackup.cfg ]; then
    ln -s ~/Documents/dotfiles/mackup-backup/.mackup.cfg ~/.mackup.cfg
    ln -s ~/Documents/dotfiles/mackup-backup/.mackup ~/.mackup
fi
mackup restore
