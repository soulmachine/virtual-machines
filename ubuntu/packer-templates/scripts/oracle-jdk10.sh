#!/bin/bash
# see https://www.linuxuprising.com/2018/04/install-oracle-java-10-in-ubuntu-or.html
echo "#################### Install Oracle JDK ####################"
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:linuxuprising/java
sudo apt update
echo oracle-java10-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt install -y oracle-java10-installer
#sudo apt install oracle-java10-set-default

sudo sh -c "echo 'export JAVA_HOME=/usr/lib/jvm/java-10-oracle' >> /etc/profile"
sudo sh -c "echo 'export CLASSPATH=\$JAVA_HOME/lib/*:\$JAVA_HOME/jre/lib/*' >> /etc/profile"
sudo sh -c "echo 'export PATH=\$PATH:\$JAVA_HOME/bin' >> /etc/profile"
