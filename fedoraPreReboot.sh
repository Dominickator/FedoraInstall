#!/bin/bash

echo "Configuring DNF..."
sudo sh -c 'echo "max_parallel_downloads=20" >>/etc/dnf/dnf.conf'
sudo sh -c 'echo "defaultyes=True" >>/etc/dnf/dnf.conf'
sudo sh -c 'echo "keepcache=True" >>/etc/dnf/dnf.conf'

#Installing gnome console
echo "Installing GNOME Console..."
sudo dnf install gnome-console --assumeyes

#Updating necessary components and restarting
echo "Updating and rebooting... Run 'fedoraPostReboot.sh'"
sudo systemctl disable NetworkManager-wait-online.service
sudo dnf install dnf5 --assumeyes
sudo dnf5 install cabextract curl dkms gnome-tweaks adw-gtk3-theme kgx --assumeyes
sudo dnf copr enable trixieua/mutter-patched -y && sudo dnf update --refresh
sudo mount /dev/nvme0n1p3 /mnt
cd /mnt/Windows/Fonts
sudo cp -r * /usr/share/fonts
sudo fc-cache -fv
sudo dnf5 update --assumeyes
sudo dnf5 upgrade --assumeyes
reboot
