#!/bin/bash
echo "#################### Configure default locale ####################"

# Configure default locale
RUN sudo apt -qy update && sudo apt -qy install locales \
 && echo "en_US.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen \
 && sudo locale-gen en_US.UTF-8 \
 && sudo /usr/sbin/update-locale LANG=en_US.UTF-8 \
 && sudo apt -qy autoremove \
 && sudo apt -qy clean \
 && sudo rm -rf /var/lib/apt/lists/*

echo -e "export LC_ALL=en_US.UTF-8\nexport LANG=en_US.UTF-8\nexport LANGUAGE=en_US:en" | sudo tee /etc/profile.d/utf8_locale.sh

