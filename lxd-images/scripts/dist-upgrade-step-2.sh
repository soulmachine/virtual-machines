#!/bin/bash
echo "#################### Upgrade the OS with dist-upgrade step 2 ####################"

num_old_kernels=$(dpkg --list | grep linux-image | awk '{ print $2 }' | sort -V | sed -n '/'"$(uname -r | sed "s/\([0-9.-]*\)-\([^0-9]\+\)/\1/")"'/q;p' | wc -l)
if [[ $num_old_kernels -eq 0 ]]; then
  echo "Nice, there is no old kernel"
  exit
fi

# Delete unused kernels
# See http://askubuntu.com/questions/2793/how-do-i-remove-old-kernel-versions-to-clean-up-the-boot-menu
dpkg --list | grep linux-image | awk '{ print $2 }' | sort -V | sed -n '/'"$(uname -r | sed "s/\([0-9.-]*\)-\([^0-9]\+\)/\1/")"'/q;p' | xargs sudo apt-get -y purge
dpkg --list | grep linux-headers | awk '{ print $2 }' | sort -V | sed -n '/'"$(uname -r | sed "s/\([0-9.-]*\)-\([^0-9]\+\)/\1/")"'/q;p' | xargs sudo apt-get -y purge

sudo reboot
