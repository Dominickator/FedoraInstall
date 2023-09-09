#!/bin/bash

#Enable RPM Fusion
echo "Enabling RPM Fusion..."
sudo dnf install fedora-workstation-repositories
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "Installing applications..."
sudo dnf5 install git steam lutris
sudo dnf5 install discord
flatpak install flathub com.mattjakeman.ExtensionManager -y
flatpak install flathub com.microsoft.Edge -y

#Installing xone and headsetControl
echo "Installing xone and headsetcontrol..."
cd ~/Documents
git clone https://github.com/medusalix/xone
cd xone
sudo ./install.sh --release
sudo xone-get-firmware.sh

cd ~/Documents
sudo dnf5 install cmake hidapi-devel g++
git clone https://github.com/Sapd/HeadsetControl && cd HeadsetControl
mkdir build && cd build
cmake ..
make
sudo make install

#Installing VSCode
echo "Installing VSCode..."
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf check-update
sudo dnf install code

#Switch to mesa freeworld
echo "Switching to Mesa Freeworld..."
sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld
sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld

#Updating and rebooting
echo "Updating and rebooting..."
sudo dnf5 update
sudo dnf5 upgrade
reboot
