#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# For Swaylock

CONFIG="$HOME/.config/swaylock/config"
#sleep 0.5s; swaylock --config ${CONFIG} & disown


if acpi -a | grep -q "on"; then
  echo "on power"
else
  echo "off"
  sleep 0.5s; swaylock --config ${CONFIG} & disown
fi

