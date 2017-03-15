#!/bin/bash
echo "#################### Install IntelliJ Idea ####################"
idea_version="2016.3.5"
wget https://download-cf.jetbrains.com/idea/ideaIU-${idea_version}.tar.gz -P ~/Downloads/
sudo tar -zxf ~/Downloads/ideaIU-${idea_version}.tar.gz -C /opt
rm ~/Downloads/*
tmp_array=( /opt/idea-I* )
path=${tmp_array[0]}
echo -e "[Desktop Entry]\nName=IntelliJ IDEA Ultimate Edition\nIcon=$path/bin/idea.png\nExec=\"$path/bin/idea.sh\" %f\nVersion=${idea_version}\nType=Application\nComment=Develop with pleasure\nCategories=Development;IDE;\nTerminal=false\nStartupWMClass=jetbrains-idea-ce\nStartupNotify=true\n" | sudo tee /usr/share/applications/jetbrains-idea-ce.desktop
sudo chmod u+x /usr/share/applications/jetbrains-idea-ce.desktop
