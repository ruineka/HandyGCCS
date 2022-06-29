#!/bin/bash
set -e

echo "Removing HandyGCCS..."
sudo systemctl stop handycon && systemctl disable handycon
sudo rm -v /usr/local/bin/handycon.py 
sudo rm -v /etc/systemd/system/handycon.service 
sudo rm -v /etc/udev/rules.d/60-handycon.rules 
sudo udevadm control -R
echo "Removal complete. Original configuration has been restored."
exit 0
