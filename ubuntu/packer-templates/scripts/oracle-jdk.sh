#!/bin/bash
echo "#################### Install Oracle JDK ####################"
sudo apt-get update -y
sudo apt-get install -y python-software-properties
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update -y
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get install -y oracle-java8-installer
sudo apt-get install -y oracle-java8-set-default
sudo sh -c "echo 'export JAVA_HOME=/usr/lib/jvm/java-8-oracle' >> /etc/profile"
sudo sh -c "echo 'export CLASSPATH=\$JAVA_HOME/lib/*:\$JAVA_HOME/jre/lib/*' >> /etc/profile"
sudo sh -c "echo 'export PATH=\$PATH:\$JAVA_HOME/bin' >> /etc/profile"
