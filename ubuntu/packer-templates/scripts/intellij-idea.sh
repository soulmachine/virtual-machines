#!/bin/bash
echo "#################### Install IntelliJ Idea ####################"
wget https://download-cf.jetbrains.com/idea/ideaIC-2016.1.3.tar.gz
sudo tar -zxf ideaIC-2016.1.3.tar.gz -C /opt
tmp_array=( /opt/idea-I* )
path=${tmp_array[0]}
sudo sh -c "echo '[Desktop Entry]\nName=IntelliJ IDEA Community Edition\nIcon=$path/bin/idea.png\nExec=\"$path/bin/idea.sh\" %f\nVersion=1.0\nType=Application\nComment=Develop with pleasure\nCategories=Development;IDE;\nTerminal=false\nStartupWMClass=jetbrains-idea-ce\nStartupNotify=true\n' > /usr/share/applications/jetbrains-idea-ce.desktop"
sudo chmod u+x /usr/share/applications/jetbrains-idea-ce.desktop