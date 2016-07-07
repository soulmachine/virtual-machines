#!/bin/bash
echo "#################### Cleanup ####################"
sudo apt-get clean
sudo apt-get autoremove
sudo rm -rf ~/Downloads/*
sudo rm -rf /var/run/vmblock-fuse/blockdir/*/*
sudo rm -rf /var/cache/*.tar.gz
sudo rm -rf /var/cache/*/*.tar.gz
history -cw
