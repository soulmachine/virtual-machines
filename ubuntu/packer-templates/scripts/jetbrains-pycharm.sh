#!/bin/bash
echo "#################### Install JetBrains WebStorm ####################"
wget https://download.jetbrains.com/python/pycharm-professional-2016.2.3.tar.gz -P ~/Downloads/
sudo tar -zxf ~/Downloads/pycharm-professional-2016.2.3.tar.gz -C /opt
rm ~/Downloads/*
tmp_array=( /opt/pycharm-* )
path=${tmp_array[0]}
echo -e "[Desktop Entry]\nName=JetBrains PyCharm\nIcon=$path/bin/pycharm.png\nExec=\"$path/bin/pycharm.sh\" %f\nVersion=2016.2.3\nType=Application\nComment=Develop with pleasure\nCategories=Development;IDE;\nTerminal=false\nStartupWMClass=jetbrains-pycharm\nStartupNotify=true\n" | sudo tee  /usr/share/applications/jetbrains-pycharm.desktop
sudo chmod u+x /usr/share/applications/jetbrains-pycharm.desktop

