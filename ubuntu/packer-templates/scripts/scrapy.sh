#!/bin/bash
echo "#################### Install Scrapy ####################"
# Install Scrapy
# See http://scrapy.readthedocs.io/en/latest/intro/install.html#ubuntu-12-04-or-above
# Also install some essential scrapy plugins such as scrapy-deltafetch
sudo apt -qy update && sudo apt -qy dist-upgrade && sudo apt -qy --no-install-recommends install \
    build-essential \
    python3 \
    python3-dev \
    python3-pip \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libffi-dev \
    libssl-dev \
    libdb-dev \
 && sudo pip3 install --upgrade pip \
 && sudo pip3 install setuptools wheel \
 && sudo pip3 install scrapy \
 && sudo pip3 install bsddb3 \
 && sudo pip3 install scrapy-deltafetch \
 && sudo pip3 install pillow \
 && sudo apt -qy purge build-essential \
 && sudo apt -qy autoremove \
 && sudo apt -qy clean \
 && sudo rm -rf /var/lib/apt/lists/*

