#!/bin/bash
echo "#################### Install JetBrains RubyMine ####################"
rubymine_version="2017.1"
wget https://download-cf.jetbrains.com/ruby/RubyMine-${rubymine_version}.tar.gz -P ~/Downloads/
sudo tar -zxf ~/Downloads/RubyMine-${rubymine_version}.tar.gz -C /opt
rm ~/Downloads/*
tmp_array=( /opt/RubyMine-* )
path=${tmp_array[0]}
echo -e "[Desktop Entry]\nVersion=${rubymine_version}\nType=Application\nName=RubyMine\nIcon=$path/bin/RMlogo.svg\nExec=\"$path/bin/rubymine.sh\" %f\nComment=The Drive to Develop\nCategories=Development;IDE;\nTerminal=false\nStartupWMClass=jetbrains-rubymine\n" | sudo tee  /usr/share/applications/jetbrains-rubymine.desktop

