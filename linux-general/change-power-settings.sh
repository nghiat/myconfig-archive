#!/bin/bash
sudo sed -i 's/#HandleLidSwitch=suspend.*/HandleLidSwitch=ignore/' /etc/systemd/logind.conf
sudo sed -i 's/#HandlePowerKey.*/HandlePowerKey=suspend/' /etc/systemd/logind.conf
sudo sed -i 's/#DefaultTimeoutStartSec.*/DefaultTimeoutStartSec=10s/' /etc/systemd/system.conf
sudo sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=10s/' /etc/systemd/system.conf
sudo systemctl daemon-reload
