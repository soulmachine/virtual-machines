#!/bin/bash
echo "#################### Install NodeJS ####################"

wget --no-check-certificate -qO- https://deb.nodesource.com/setup_16.x | bash

apt -qy install nodejs
