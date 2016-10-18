#!/bin/bash
echo "#################### Install OpenJDK 8 ####################"
sudo apt -qy update
sudo apt -qy install openjdk-8-jdk
echo -e "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64\nexport PATH=\$PATH:\$JAVA_HOME/bin\nexport CLASSPATH=\$JAVA_HOME/lib/*:\$JAVA_HOME/jre/lib/*\n" | sudo tee /etc/profile.d/openjdk.sh
