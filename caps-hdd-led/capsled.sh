#!/bin/bash
sudo cp hddled.service /etc/systemd/system/hddled.service
sudo cp hddled.sh /usr/local/bin/hddled.sh
sudo chmod 744 /usr/local/bin/hddled.sh
sudo chmod 664 /etc/systemd/system/hddled.service
systemctl daemon-reload
systemctl enable hddled.service
systemctl start hddled.service
