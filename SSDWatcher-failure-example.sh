# MAKE SURE TO NOT USE THIS FILE AS YOUR MAIN AUTOSTART PROGRAM
# This file is intended to simulate the case of a failure for testing purposes e.g. testing of the zenity popup. It will still show `PASSED` as the SMART Status if nothing is wrong, this is intended behavior.



# Insert drive path inside the quotes - use `sudo fdisk -l` to list all disks
DRIVE="/dev/sda"



STATUS=$(sudo smartctl -H "$DRIVE" | grep "SMART overall-health" | awk '{print $NF}')


notify-send -u critical "SMART Status" "⚠️ $DRIVE health: $STATUS"

#Error sound
paplay /usr/share/sounds/freedesktop/stereo/dialog-error.oga &

#Error popup
zenity --error --title="SSD Warning" --text="Your SSD may be failing! \nSMART Status: $STATUS. \n\nBackup your data NOW! \n\nFor more info, run: \nsudo smartctl -a $DRIVE" &
