#!/bin/bash
echo "#################### Install JetBrains WebStorm ####################"
pycharm_version="2016.3.2"
wget https://download.jetbrains.com/python/pycharm-professional-${pycharm_version}.tar.gz -P ~/Downloads/
sudo tar -zxf ~/Downloads/pycharm-professional-${pycharm_version}.tar.gz -C /opt
rm ~/Downloads/*
tmp_array=( /opt/pycharm-* )
path=${tmp_array[0]}
echo -e "[Desktop Entry]\nName=JetBrains PyCharm\nIcon=$path/bin/pycharm.png\nExec=\"$path/bin/pycharm.sh\" %f\nVersion=${pycharm_version}\nType=Application\nComment=Develop with pleasure\nCategories=Development;IDE;\nTerminal=false\nStartupWMClass=jetbrains-pycharm\nStartupNotify=true\n" | sudo tee  /usr/share/applications/jetbrains-pycharm.desktop
sudo chmod u+x /usr/share/applications/jetbrains-pycharm.desktop

