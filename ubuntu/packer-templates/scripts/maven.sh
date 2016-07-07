#!/bin/bash
echo "#################### Install Maven ####################"
wget http://www.motorlogy.com/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
sudo tar -zxf apache-maven-3.3.9-bin.tar.gz -C /opt
sudo sh -c "echo 'export M2_HOME=/opt/apache-maven-3.3.9' >> /etc/profile"
sudo sh -c "echo 'export PATH=\$PATH:\$M2_HOME/bin' >> /etc/profile"
