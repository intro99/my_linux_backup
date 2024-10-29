#!/bin/bash

scriptsDir=~/.config/hypr/scripts
lock=$scriptsDir/LockScreen.sh

# to check if its on power
if acpi -a | grep -q "on"; then
  #echo "on power"
  
  if pgrep -x "swayidle" > /dev/null; then
    #notify-send -e -u low -i "$notif" "no sleep"
    pkill -x swayidle
  fi  

else
  echo "off"
  
  swayidle_command="swayidle -w \
  timeout 900 'hyprctl dispatch dpms off' \
  timeout 950 '$lock' \
  timeout 1000 'systemctl suspend' \
  resume 'hyprctl dispatch dpms on' \
  before-sleep '$lock'"

  # Check if swayidle is running
  if ! pgrep -x "swayidle" > /dev/null; then
    #echo "swayidle is not running. Starting swayidle..."
    #notify-send -e -u low -i "$notif" "sleep"
    eval "$swayidle_command &"
  fi
fi