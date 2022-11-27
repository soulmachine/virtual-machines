#!/bin/bash
echo "#################### Install xfce4 desktop ####################"

sudo apt install -qy --no-install-recommends xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils xrdp
sudo update-alternatives --set x-session-manager /usr/bin/xfce4-session

sudo add-apt-repository -y ppa:savoury1/chromium
sudo apt update
sudo apt install -qy chromium-browser

