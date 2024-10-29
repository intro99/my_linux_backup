#!/bin/sh

sudo btmgmt power off
sudo btmgmt public-addr 10:3D:1C:F7:FB:07
sudo btmgmt power on

sudo systemctl restart bluetooth.service
