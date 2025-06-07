# SSDWatcher
Program that checks your SSD health on every boot and notifies you early about SSD failure

Installation:
1.  Arch: `sudo pacman -S smartmontools libnotify` / Ubuntu: `sudo apt install smartmontools libnotify4`
2.  `mkdir -p ~/.local/bin`
3.  Download both .sh files and put them in ~/.local/bin
4.  `chmod +x ~/.local/bin/smart_notify.sh`
