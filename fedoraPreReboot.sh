#!/bin/bash

echo "Configuring DNF..."
sudo echo "max_parallel_downloads=20" > /etc/dnf/dnf.conf
sudo echo "defaultyes=True" > /etc/dnf/dnf.conf
sudo echo "keepcache=True" > /etc/dnf/dnf.conf

#Updating necessary components and restarting
echo "Updating and rebooting... Run 'fedoraPostReboot.sh'"
sudo dnf install dnf5
sudo dnf5 update
sudo dnf5 install cabextract curl dkms
reboot
