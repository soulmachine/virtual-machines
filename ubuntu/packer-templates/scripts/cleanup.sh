#!/bin/bash
echo "#################### Cleanup ####################"
sudo apt-get -qy clean
sudo apt-get -qy autoremove
sudo rm -rf /var/lib/apt/lists/*
sudo rm -rf ~/Downloads/*
sudo rm -rf /var/run/vmblock-fuse/blockdir/*/*
sudo rm -rf /var/cache/*.tar.gz
sudo rm -rf /var/cache/*/*.tar.gz
history -cw
