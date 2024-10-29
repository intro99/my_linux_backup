#!/bin/bash


# Define options for the menu
options="ScreenShort\nscreenShort region\nScreenRecord\nScreenRecord Region\nStop ScreenRecord"

# Display the Rofi menu and get the user's selection
selected_option=$(echo -e "$options" | rofi -dmenu -p "Custom Menu")

# Execute actions based on the user's selection
case $selected_option in
    "ScreenShort")
        
        # Action for Option 1
        bash ~/.config/hypr/scripts/ScreenShot.sh --now
        
        ;;
    "screenShort region")
        # Action for Option 2
        bash ~/.config/hypr/scripts/ScreenShot.sh --area
        
        ;;
    "ScreenRecord")
        # Action for Option 3
        
        bash ~/.config/hypr/scripts/start_rec.sh --start
        ;;
    "ScreenRecord Region")
        # Action for Option 4
        bash ~/.config/hypr/scripts/start_rec.sh --reg
        ;;
    "Stop ScreenRecord")
        # Action for Option 4
        bash ~/.config/hypr/scripts/start_rec.sh --stop
        ;;
    *)
        # Default action if selection is invalid
        echo "Invalid selection"
        ;;
esac
