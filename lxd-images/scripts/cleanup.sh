#!/bin/bash
echo "#################### Cleanup ####################"
sudo apt -qy autoremove
sudo apt -qy autoclean
sudo rm -rf /var/lib/apt/lists/*
sudo rm -rf /tmp/*
sudo rm -rf ~/Downloads/*
sudo rm -rf /var/run/vmblock-fuse/blockdir/*/*
sudo rm -rf /var/cache/*.tar.gz
sudo rm -rf /var/cache/*/*.tar.gz
history -cw
