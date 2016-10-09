#!/bin/bash
echo "#################### Install OpenJDK 8 ####################"
sudo apt -qy update
sudo apt-get install unattended-upgrades
echo -e 'APT::Periodic::Update-Package-Lists "0";\nAPT::Periodic::Unattended-Upgrade "0";' | sudo tee /etc/apt/apt.conf.d/20auto-upgrades
