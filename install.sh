#!/bin/bash
set -e
echo "Installing HandyGCCS..."
echo "Enabling controller functionality. NEXT users will need to configure the Home button in steam."
sudo cp -v handycon.py /usr/local/bin/
sudo cp -v handycon.service /etc/systemd/system/
sudo cp -v 60-handycon.rules /etc/udev/rules.d/
sudo udevadm control -R
sudo systemctl enable handycon && systemctl start handycon
echo "Installation complete. You should now have additional controller functionality."
exit 0
