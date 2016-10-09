#!/bin/bash
echo "#################### Install OpenJDK 8 ####################"
sudo apt -qy update -y
sudo apt -qy install openjdk-8-jdk
sudo sh -c "echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> /etc/profile"
sudo sh -c "echo 'export CLASSPATH=\$JAVA_HOME/lib/*:\$JAVA_HOME/jre/lib/*' >> /etc/profile"
sudo sh -c "echo 'export PATH=\$PATH:\$JAVA_HOME/bin' >> /etc/profile"
