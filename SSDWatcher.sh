# Insert drive path inside the quotes - use `sudo fdisk -l` to list all disks
DRIVE="/dev/sda"



# No need to change following code if program is working fine
STATUS=$(sudo smartctl -H "$DRIVE" | grep "SMART overall-health" | awk '{print $NF}')

if [[ "$STATUS" == "PASSED" ]]; then
    notify-send "SMART Status" "✅ $DRIVE health: PASSED"
else
    notify-send -u critical "SMART Status" "⚠️ $DRIVE health: $STATUS"

    #Error sound
    paplay /usr/share/sounds/freedesktop/stereo/dialog-error.oga &

    #Error popup
    zenity --error --title="SSD Warning" --text="Your SSD may be failing! \nSMART Status: $STATUS. \n\nBackup your data NOW! \n\nFor more info, run: \nsudo smartctl -a $DRIVE" &
fi
