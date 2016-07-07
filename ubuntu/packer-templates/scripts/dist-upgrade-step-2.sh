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

# Re-install open-vm-tools
# If you want to use shared folders you also need to install open-vm-tools-dkms
sudo apt-get remove --purge -y open-vm-tools open-vm-tools-dkms open-vm-tools-desktop
if dpkg -l ubuntu-desktop > /dev/null; then
  # GUI install for desktop
  sudo apt-get install -y --no-install-recommends open-vm-tools-desktop open-vm-tools-dkms
else
  # Headless install for no-GUI server
  sudo apt-get install -y --no-install-recommends open-vm-tools open-vm-tools-dkms
fi

sudo reboot
