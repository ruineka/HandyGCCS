#!/bin/bash
set -e
echo "Installing HandyGCCS..."
sudo apt -y install - < pkg_depends.list
< pip_depends.list xargs python3 pip install
echo "Enabling controller functionality. NEXT users will need to configure the Home button in steam."
sudo cp -v handycon.py /usr/local/bin/
sudo cp -v handycon.service /etc/systemd/system/
sudo cp -v 60-handycon.rules /etc/udev/rules.d/
sudo udevadm control -R
sudo systemctl enable handycon && systemctl start handycon
echo "Installation complete. You should now have additional controller functionality."
exit 0
