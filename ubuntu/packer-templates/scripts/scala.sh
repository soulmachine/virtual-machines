#!/bin/bash
echo "#################### Install scala ####################"
sudo apt -qy install scala

# see http://www.scala-sbt.org/release/docs/Installing-sbt-on-Linux.html
echo "#################### Install sbt ####################"
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
sudo apt-get -qy update
sudo apt-get -qy install sbt

