#!/bin/bash
echo "#################### Install JetBrains WebStorm ####################"
webstorm_version="2016.2.3"
wget https://download-cf.jetbrains.com/webstorm/WebStorm-${webstorm_version}.tar.gz -P ~/Downloads/
if [ "$?" != 0 ]; then
  exit 1
fi
sudo tar -zxf ~/Downloads/WebStorm-${webstorm_version}.tar.gz -C /opt
rm ~/Downloads/*
tmp_array=( /opt/WebStorm-* )
path=${tmp_array[0]}
echo -e "[Desktop Entry]\nName=JetBrains WebStorm\nIcon=$path/bin/webstorm.svg\nExec=\"$path/bin/webstorm.sh\" %f\nVersion=${webstorm_version}\nType=Application\nComment=Develop with pleasure\nCategories=Development;IDE;\nTerminal=false\nStartupWMClass=jetbrains-webstorm\nStartupNotify=true\n" | sudo tee  /usr/share/applications/jetbrains-webstorm.desktop
sudo chmod u+x /usr/share/applications/jetbrains-webstorm.desktop

