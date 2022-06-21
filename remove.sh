#!/bin/bash
set -e

echo "Removing reboot kernel panic fix."
rm -v /usr/lib/systemd/system-shutdown/mt7921e.shutdown

echo "Removing loss of WiFi on suspend fix."
rm -v /etc/systemd-suspend-mods.conf
rm /usr/lib/systemd/system-sleep/systemd-suspend-mods.sh

echo "Disabling unmapped buttons."
systemctl stop handycon && systemctl disable handycon
rm -v /etc/systemd/system/handycon.service
rm -v /usr/local/bin/handycon.py
rm -v /etc/udev/rules.d/60-handycon.rules 

exit 0
