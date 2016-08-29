#!/bin/bash
echo "#################### Install NodeJS ####################"
sudo apt-get -qy install wget build-essential

wget --no-check-certificate -qO- https://deb.nodesource.com/setup_6.x | sudo bash

sudo apt-get -qy install nodejs
