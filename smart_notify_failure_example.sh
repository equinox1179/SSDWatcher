#Insert drive path here
DRIVE="/dev/sda"



STATUS=$(sudo smartctl -H "$DRIVE" | grep "SMART overall-health" | awk '{print $NF}')

if [[ "$STATUS" == "PASSED" ]]; then
        notify-send -u critical "SMART Status" "⚠️ $DRIVE health: $STATUS"

    #Error sound
    paplay /usr/share/sounds/freedesktop/stereo/dialog-error.oga &

    #Error popup
    zenity --error --title="SSD Warning" --text="Your SSD may be failing! \nSMART Status: $STATUS. \n\nBackup your data NOW! \n\nFor more info, run: \nsudo smartctl -a $DRIVE" &
else
    notify-send "SMART Status" "✅ $DRIVE health: PASSED"
fi
