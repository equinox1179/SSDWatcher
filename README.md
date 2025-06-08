# SSDWatcher
Program that checks your SSD health on every boot and notifies you early about SSD failure

Installation:
1.  Arch: `sudo pacman -S smartmontools libnotify` / Ubuntu: `sudo apt install smartmontools libnotify4`
2.  `mkdir -p ~/.local/bin`
3.  Download both .sh files and put them in ~/.local/bin
4.  Insert your drive path (e.g. /dev/sda) into $DRIVE in both files
5.  `chmod +x ~/.local/bin/SSDWatcher.sh` + `chmod +x ~/.local/bin/SSDWatcher-failure-example.sh`
6.  Test the files by running `~/.local/bin/SSDWatcher.sh` / `~/.local/bin/SSDWatcher-failure-example.sh`. The normal one should output a notification with the drive status being 'PASSED', the failure example should trigger a warning notification and a big popup with steps to follow next. If these do not work, a warning in case of failure also won't. Don't proceed and fix the issue first.
