#!/bin/bash
echo "#################### Upgrade the OS with dist-upgrade ####################"

sudo apt-get update -y
sudo apt-get dist-upgrade -y
sudo reboot
