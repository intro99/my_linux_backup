#!/bin/bash

sleep 0.5s; swaylock --config ${CONFIG} & disown &&  hyprctl dispatch dpms off && systemctl suspend