#!/bin/bash
read -rep $'Please enther the new username:\n' username

read -rep $'Please enther your ZeroTier network ID(default to empty):\n' zerotier_network_id

echo "Deploying a new devcontainer for $username"

lxc launch ubuntu-devcontainer ubuntu-devcontainer-$username

# create the new user
lxc exec ubuntu-devcontainer-$username -- useradd $username -u $(id -u) -m -s /bin/bash
# grant password-less sudo
lxc exec ubuntu-devcontainer-$username -- bash -ilc "echo \"$username ALL=(ALL) NOPASSWD:ALL\" > /etc/sudoers.d/$username"

# copy .gitconfig
lxc exec ubuntu-devcontainer-$username -- cp /root/.gitconfig /home/$username/.gitconfig
lxc exec ubuntu-devcontainer-$username -- chown $username:$username /home/$username/.gitconfig

# configure ZeroTier
if [ ! -z "$zerotier_network_id" ]
then
    lxc exec ubuntu-devcontainer-$username -- bash -ilc "zerotier-cli join $zerotier_network_id && zerotier-cli set $zerotier_network_id allowDNS=1"
fi

# for shared folder and docker
lxc config set ubuntu-devcontainer-$username security.privileged true
lxc config set ubuntu-devcontainer-$username security.nesting true
lxc restart ubuntu-devcontainer-$username
