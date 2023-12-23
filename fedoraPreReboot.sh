#!/bin/bash

echo "Configuring DNF..."
sudo sh -c 'echo "max_parallel_downloads=20" >>/etc/dnf/dnf.conf'
sudo sh -c 'echo "defaultyes=True" >>/etc/dnf/dnf.conf'
sudo sh -c 'echo "keepcache=True" >>/etc/dnf/dnf.conf'

#Installing gnome console
echo "Installing GNOME Console..."
sudo dnf install gnome-console

#Updating necessary components and restarting
echo "Updating and rebooting... Run 'fedoraPostReboot.sh'"
sudo dnf install dnf5
sudo dnf5 install cabextract curl dkms gnome-tweaks adw-gtk3-theme kgx
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install lame* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia
sudo dnf copr enable trixieua/mutter-patched -y && sudo dnf update --refresh
sudo mount /dev/nvme0n1p3 /mnt
cd /mnt/Windows/Fonts
sudo cp -r * /usr/share/fonts
sudo fc-cache -fv
sudo dnf5 update
sudo dnf5 upgrade
reboot
