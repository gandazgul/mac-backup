#!/bin/bash -e
RESTORE_LOG=~/.restore.log

# Start logging
if [[ "$1" != "--logged" ]]; then
  $0 --logged 2>&1 | tee -a ${RESTORE_LOG}
  exit
fi

pinfo() {
  pecho ✅ $@
}

pwarn() {
  pecho 🔥 $@
}

pnotice() {
  pecho 💡 $@
}

pecho() {
  local icon="$1"; shift
  local date=`date`

  echo -e "${date}\t$icon  $@"
}

prompt() {
  pecho 🚧 "Press any key to continue"
  read -n 1 -s
}

pinfo "Starting restore process"

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

pinfo "Creating local folders"
mkdir -p ~/.bin ~/Sites

source ./sources/1-homebrew.sh
source ./sources/2-apps.sh
source ./sources/3-shell.sh
source ./sources/4-backup.sh
source ./sources/5-settings.sh

pinfo "Finished restore process"
pwarn "Reboot required!"
prompt
sudo reboot
