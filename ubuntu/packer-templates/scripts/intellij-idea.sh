#!/bin/bash
echo "#################### Install IntelliJ Idea ####################"
wget https://download-cf.jetbrains.com/idea/ideaIC-2016.2.4.tar.gz -P ~/Downloads/
sudo tar -zxf ~/Downloads/ideaIC-2016.2.4.tar.gz -C /opt
rm ~/Downloads/*
tmp_array=( /opt/idea-I* )
path=${tmp_array[0]}
echo -e "[Desktop Entry]\nName=IntelliJ IDEA Community Edition\nIcon=$path/bin/idea.png\nExec=\"$path/bin/idea.sh\" %f\nVersion=1.0\nType=Application\nComment=Develop with pleasure\nCategories=Development;IDE;\nTerminal=false\nStartupWMClass=jetbrains-idea-ce\nStartupNotify=true\n" | sudo tee /usr/share/applications/jetbrains-idea-ce.desktop
sudo chmod u+x /usr/share/applications/jetbrains-idea-ce.desktop
