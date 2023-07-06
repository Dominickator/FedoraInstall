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
echo "Installing vscode..."
cd 
cd Downloads
wget https://code.visualstudio.com/sha/download?build=stable&os=linux-rpm-x64
sudo rpm -i *.rpm
