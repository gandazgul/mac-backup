# My Mac Backup

Bootstrap script to restore my Mac

Based on https://github.com/stjohnjohnson/stunning-potato

## Flow

1. Install Homebrew
2. Restore files from backup
3. Restore local settings
4. Install software
5. Setup OSX settings
7. Reboot

## Usage

```bash
$ curl -L -o backup.zip https://github.com/gandazgul/mac-backup/archive/master.zip
$ unzip backup.zip
$ pushd mac-backup-master
$ ./restore.sh
```

## Todo

- [ ] Restore wallpaper / screensaver
