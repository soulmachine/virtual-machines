#!/bin/bash
echo "#################### Install JetBrains PyCharm ####################"
pycharm_version="2017.1"
wget https://download.jetbrains.com/python/pycharm-professional-${pycharm_version}.tar.gz -P ~/Downloads/
if [ "$?" != 0 ]; then
  exit 1
fi
sudo tar -zxf ~/Downloads/pycharm-professional-${pycharm_version}.tar.gz -C /opt
rm ~/Downloads/*
tmp_array=( /opt/pycharm-* )
path=${tmp_array[0]}
echo -e "[Desktop Entry]\nVersion=1.0\nType=Application\nName=PyCharm\nIcon=$path/bin/pycharm.png\nExec=\"$path/bin/pycharm.sh\" %f\nComment=The Drive to Develop\nCategories=Development;IDE;\nTerminal=false\nStartupWMClass=jetbrains-pycharm\n" | sudo tee /usr/share/applications/jetbrains-pycharm.desktop

