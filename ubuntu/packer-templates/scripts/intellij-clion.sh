#!/bin/bash
echo "#################### Install IntelliJ CLion ####################"
clion_version="2016.3.4"
wget https://download-cf.jetbrains.com/cpp/CLion-${clion_version}.tar.gz -P ~/Downloads/
sudo tar -zxf ~/Downloads/CLion-${clion_version}.tar.gz -C /opt
rm ~/Downloads/*
tmp_array=( /opt/clion-* )
path=${tmp_array[0]}
echo -e "[Desktop Entry]\nName=JetBrains CLion\nIcon=$path/bin/clion.svg\nExec=\"$path/bin/clion.sh\" %f\nVersion=${clion_version}\nType=Application\nComment=Develop with pleasure\nCategories=Development;IDE;\nTerminal=false\nStartupWMClass=jetbrains-clion\nStartupNotify=true\n" | sudo tee  /usr/share/applications/jetbrains-clion.desktop
sudo chmod u+x /usr/share/applications/jetbrains-clion.desktop
