#!/bin/bash
echo "#################### Install JetBrains WebStorm ####################"
webstorm_version="2018.2.3"
wget https://download-cf.jetbrains.com/webstorm/WebStorm-${webstorm_version}.tar.gz -P ~/Downloads/
if [ "$?" != 0 ]; then
  exit 1
fi
sudo tar -zxf ~/Downloads/WebStorm-${webstorm_version}.tar.gz -C /opt
rm ~/Downloads/WebStorm*
tmp_array=( /opt/WebStorm-* )
path=${tmp_array[0]}
echo -e "[Desktop Entry]\nVersion=1.0\nType=Application\nName=WebStorm\nIcon=$path/bin/webstorm.svg\nExec=\"$path/bin/webstorm.sh\" %f\nComment=The Drive to Develop\nCategories=Development;IDE;\nTerminal=false\nStartupWMClass=jetbrains-webstorm\n" | sudo tee /usr/share/applications/jetbrains-webstorm.desktop

