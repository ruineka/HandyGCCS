#!/bin/bash
set -e

echo "Adding reboot kernel panic fix."
cp -v mt7921e.shutdown /usr/lib/systemd/system-shutdown

echo "Adding suspend loss of WiFi on suspend fix"
cp -v systemd-suspend-mods.conf /etc/systemd-suspend-mods.conf
cp -v systemd-suspend-mods.sh /usr/lib/systemd/system-sleep/systemd-suspend-mods.sh

echo "Enabling unmapped buttons. NEXT users will need to configure the Home button in steam."
cp -v handycon.py /usr/local/bin/
cp -v handycon.service /etc/systemd/system
cp -v 60-handycon.rules /etc/udev/rules.d/
systemctl enable handycon && systemctl start handycon

exit 0
