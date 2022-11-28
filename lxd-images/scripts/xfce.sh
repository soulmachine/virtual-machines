#!/bin/bash
echo "#################### Install xfce4 desktop ####################"

sudo apt install -qy --no-install-recommends xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils
sudo update-alternatives --set x-session-manager /usr/bin/xfce4-session

# Need to install xrdp after xfce4, otherwise there is a black screen issue
sudo apt install -qy xrdp
sudo systemctl start xrdp
sudo systemctl enable xrdp
# sudo systemctl status xrdp

sudo add-apt-repository -y ppa:savoury1/chromium
sudo apt update
sudo apt install -qy chromium-browser

