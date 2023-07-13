#!/bin/bash

echo "Configuring DNF..."
sudo sh -c 'echo "max_parallel_downloads=20" >>/etc/dnf/dnf.conf'
sudo sh -c 'echo "defaultyes=True" >>/etc/dnf/dnf.conf'
sudo sh -c 'echo "keepcache=True" >>/etc/dnf/dnf.conf'

#Updating necessary components and restarting
echo "Updating and rebooting... Run 'fedoraPostReboot.sh'"
sudo dnf install dnf5
sudo dnf5 install cabextract curl dkms gnome-tweaks adw-gtk3-theme kgx
sudo dnf5 update
sudo dnf5 upgrade
reboot
