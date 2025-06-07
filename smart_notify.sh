#!/bin/bash

DRIVE="/dev/sda"  # change if needed
STATUS=$(sudo smartctl -H "$DRIVE" | grep "SMART overall-health" | awk '{print $NF}')

if [[ "$STATUS" == "PASSED" ]]; then
    notify-send "SMART Status" "✅ $DRIVE health: PASSED"
else
    notify-send -u critical "SMART Status" "⚠️ $DRIVE health: $STATUS"
    
    # Play error sound
    paplay /usr/share/sounds/freedesktop/stereo/dialog-error.oga &

    # Show a window with next steps
    zenity --error \
        --title="⚠️ SSD Warning – $DRIVE" \
        --text="Your SSD may be failing!\n\nSMART Status: $STATUS\n\n⚠️ Back up important data NOW.\n🧰 Consider replacing the drive.\n🔍 Run: sudo smartctl -a $DRIVE for full details." &
fi
