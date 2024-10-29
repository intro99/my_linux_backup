#!/bin/bash


#hyprctl dispatch movetoworkspace 10
if ! hyprctl clients -j | jq '.[].workspace.id' | grep -q 10; then
    
    #echo "Command can be executed because '10' is not found."
    #hyprctl dispatch movetoworkspace 10 && hyprctl dispatch togglegroup
     hyprctl dispatch togglegroup && hyprctl dispatch movetoworkspacesilent 10 
    
else
    hyprctl dispatch movetoworkspace 10 && hyprctl dispatch moveintogroup r
fi
