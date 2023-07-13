#!/bin/bash

echo "Installing applications..."
sudo dnf5 install git steam
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub com.mattjakeman.ExtensionManager

#Installing xone and headsetControl
echo "Installing xone and headsetcontrol..."
cd Documents
git clone https://github.com/medusalix/xone
cd xone
sudo ./install.sh --release
sudo xone-get-firmware.sh

cd
cd Documents
sudo dnf5 install cmake hidapi-devel g++
git clone https://github.com/Sapd/HeadsetControl && cd HeadsetControl
mkdir build && cd build
cmake ..
make
sudo make install

#Installing VSCode
echo "Installing VSCode..."
cd 
cd Downloads
wget https://code.visualstudio.com/sha/download?build=stable&os=linux-rpm-x64
sudo rpm -i *.rpm

#Enable RPM Fusion
echo "Enabling RPM Fusion..."
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#Switch to mesa freeworld
echo "Switching to Mesa Freeworld..."
sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld
sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld
sudo dnf5 install google-chrome-stable

#Updating and rebooting
echo "Updating and rebooting..."
sudo dnf5 update
sudo dnf5 upgrade
reboot
