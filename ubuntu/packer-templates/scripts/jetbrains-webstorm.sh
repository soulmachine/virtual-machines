#!/bin/bash
echo "#################### Install JetBrains WebStorm ####################"
wget https://download-cf.jetbrains.com/webstorm/WebStorm-2016.2.2.tar.gz -P ~/Downloads/
sudo tar -zxf ~/Downloads/WebStorm-2016.2.2.tar.gz -C /opt
rm ~/Downloads/*
tmp_array=( /opt/WebStorm-* )
path=${tmp_array[0]}
echo -e "[Desktop Entry]\nName=JetBrains WebStorm\nIcon=$path/bin/webstorm.svg\nExec=\"$path/bin/webstorm.sh\" %f\nVersion=2016.2.2\nType=Application\nComment=Develop with pleasure\nCategories=Development;IDE;\nTerminal=false\nStartupWMClass=jetbrains-webstorm\nStartupNotify=true\n" | sudo tee  /usr/share/applications/jetbrains-webstorm.desktop
sudo chmod u+x /usr/share/applications/jetbrains-webstorm.desktop

