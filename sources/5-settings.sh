#!/usr/bin/env bash

# ~/.macos — https://mths.be/macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

###############################################################################
pinfo "General UI/UX"
###############################################################################

pnotice "Set computer name (as done via System Preferences → Sharing)"
sudo scutil --set ComputerName "gandazgul-mbp"
sudo scutil --set HostName "gandazgul-mbp"
sudo scutil --set LocalHostName "gandazgul-mbp"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "gandazgul-mbp"

pnotice "Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

pnotice "Expand print panel by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

pnotice "Save to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

pnotice "Disable the “Are you sure you want to open this application?” dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

pnotice "Disable the crash reporter"
defaults write com.apple.CrashReporter DialogType -string "none"

pnotice "Disable Notification Center and remove the menu bar icon"
# this wasnt working on Mojave
# launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

###############################################################################
pinfo "Trackpad, mouse, keyboard, Bluetooth accessories, and input"
###############################################################################

pnotice "Trackpad: map bottom right corner to right-click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

pnotice "Disable “natural” (Lion-style) scrolling"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

pnotice "Use scroll gesture with the Ctrl (^) modifier key to zoom"
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
pnotice "Follow the keyboard focus while zoomed in"
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

pnotice "Set language and text formats"
defaults write NSGlobalDomain AppleLanguages -array "en" "es"
defaults write NSGlobalDomain AppleLocale -string "en_US@currency=USD"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Inches"
defaults write NSGlobalDomain AppleMetricUnits -bool false

pnotice "Set the timezone; see 'sudo systemsetup -listtimezones' for other values"
sudo systemsetup -settimezone "America/New_York" > /dev/null

###############################################################################
pinfo "Screen"
###############################################################################

pnotice "Enable subpixel font rendering on non-Apple LCDs"
# Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
defaults write NSGlobalDomain AppleFontSmoothing -int 1

###############################################################################
pinfo "Finder"
###############################################################################

pnotice "Set Home as the default location for new Finder windows"
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

pnotice "Show icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

pnotice "Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

pnotice "Finder: show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

pnotice "Finder: show path bar"
defaults write com.apple.finder ShowPathbar -bool true

pnotice "Display full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

pnotice "Keep folders on top when sorting by name"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

pnotice "When performing a search, search the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

pnotice "Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

pnotice "Enable spring loading for directories"
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

pnotice "Avoid creating .DS_Store files on network or USB volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

pnotice "Automatically open a new Finder window when a volume is mounted"
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

pnotice "Use Column view in all Finder windows by default"
# Four-letter codes for the other view modes: Icon: `icnv`, List: `Nlsv`, Column: `clmv`, Gallery: `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

pnotice "Enable AirDrop over Ethernet and on unsupported Macs running Lion"
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

pnotice "Show the ~/Library folder"
chflags nohidden ~/Library

pnotice "Show the /Volumes folder"
sudo chflags nohidden /Volumes

pnotice "Expand the following File Info panes"
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

###############################################################################
pinfo "Dock, Dashboard, and hot corners"
###############################################################################

pnotice "Wipe all (default) app icons from the Dock"
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock tilesize -int 36                    # Size
defaults write com.apple.dock orientation -string "left"          # Position on screen
defaults write com.apple.dock minimize-to-application -bool false  # Dont Minimise windows into application icon
defaults write com.apple.dock autohide -bool true                 # Automatically hide and show the Dock
defaults write com.apple.dock show-recents -bool false            # Show recent applications in Dock


pnotice "Speed up Mission Control animations"
defaults write com.apple.dock expose-animation-duration -float 0.1

pnotice "Don’t group windows by application in Mission Control"
defaults write com.apple.dock expose-group-by-app -bool false

pnotice "Disable Dashboard"
defaults write com.apple.dashboard mcx-disabled -bool true

pnotice "Don’t show Dashboard as a Space"
defaults write com.apple.dock dashboard-in-overlay -bool true

pnotice "Don’t automatically rearrange Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false

pnotice "Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

pnotice "Make Dock icons of hidden applications translucent"
defaults write com.apple.dock showhidden -bool true

pnotice "Disable hot corners"
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-tr-modifier -int 0
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-bl-modifier -int 0
defaults write com.apple.dock wvous-br-corner -int 0
defaults write com.apple.dock wvous-br-modifier -int 0

killall Dock

###############################################################################
pinfo "Spotlight"
###############################################################################

# pnotice "Hide Spotlight tray-icon (and subsequent helper)"
# sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
# Disable Spotlight indexing for any volume that gets mounted and has not yet
# been indexed before.
# Use `sudo mdutil -i off "/Volumes/foo"` to stop indexing any volume.
sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"
# Change indexing order and disable some search results
# Yosemite-specific search results (remove them if you are using macOS 10.9 or older):
# 	MENU_DEFINITION
# 	MENU_CONVERSION
# 	MENU_EXPRESSION
# 	MENU_SPOTLIGHT_SUGGESTIONS (send search queries to Apple)
# 	MENU_WEBSEARCH             (send search queries to Apple)
# 	MENU_OTHER
defaults write com.apple.spotlight orderedItems -array \
	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
	'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
	'{"enabled" = 1;"name" = "DIRECTORIES";}' \
	'{"enabled" = 1;"name" = "PDF";}' \
	'{"enabled" = 1;"name" = "FONTS";}' \
	'{"enabled" = 1;"name" = "DOCUMENTS";}' \
	'{"enabled" = 0;"name" = "MESSAGES";}' \
	'{"enabled" = 0;"name" = "CONTACT";}' \
	'{"enabled" = 0;"name" = "EVENT_TODO";}' \
	'{"enabled" = 1;"name" = "IMAGES";}' \
	'{"enabled" = 0;"name" = "BOOKMARKS";}' \
	'{"enabled" = 0;"name" = "MUSIC";}' \
	'{"enabled" = 0;"name" = "MOVIES";}' \
	'{"enabled" = 0;"name" = "PRESENTATIONS";}' \
	'{"enabled" = 0;"name" = "SPREADSHEETS";}' \
	'{"enabled" = 0;"name" = "SOURCE";}' \
	'{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
	'{"enabled" = 0;"name" = "MENU_OTHER";}' \
	'{"enabled" = 0;"name" = "MENU_CONVERSION";}' \
	'{"enabled" = 0;"name" = "MENU_EXPRESSION";}' \
	'{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
	'{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'

###############################################################################
pinfo "Terminal & iTerm 2"
###############################################################################

pnotice "Only use UTF-8 in Terminal.app"
defaults write com.apple.terminal StringEncodings -array 4

pnotice "Enable Secure Keyboard Entry in Terminal.app"
# See: https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true

###############################################################################
pinfo "Activity Monitor"
###############################################################################

pnotice "Show the main window when launching Activity Monitor"
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

pnotice "Visualize CPU usage in the Activity Monitor Dock icon"
defaults write com.apple.ActivityMonitor IconType -int 5

pnotice "Show all processes in Activity Monitor"
defaults write com.apple.ActivityMonitor ShowCategory -int 0

pnotice "Sort Activity Monitor results by CPU usage"
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

###############################################################################
pinfo "Address Book, Dashboard, iCal, TextEdit, and Disk Utility"
###############################################################################

pnotice "Use plain text mode for new TextEdit documents"
defaults write com.apple.TextEdit RichText -int 0
pnotice "Open and save files as UTF-8 in TextEdit"
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

pnotice "Enable the debug menu in Disk Utility"
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

###############################################################################
pinfo "Mac App Store"
###############################################################################

pnotice "Enable the automatic update check"
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

pnotice "Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

pnotice "Download newly available updates in background"
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

pnotice "Install System data files & security updates"
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

pnotice "Automatically download apps purchased on other Macs"
defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

pnotice "Turn on app auto-update"
defaults write com.apple.commerce AutoUpdate -bool true

pnotice "Allow the App Store to reboot machine on macOS updates"
defaults write com.apple.commerce AutoUpdateRestartRequired -bool true

###############################################################################
pinfo "Google Chrome & Google Chrome Canary"
###############################################################################

pnotice "Disable the all too sensitive backswipe on trackpads"
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

pnotice "Disable the all too sensitive backswipe on Magic Mouse"
defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableMouseSwipeNavigateWithScrolls -bool false

pnotice "Expand the print dialog by default"
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true
