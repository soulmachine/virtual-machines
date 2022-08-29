#!/bin/bash
read -rep $'Please enther the new username:\n' username

read -rep $'Please enther the SSH public key(default to empty):\n' ssh_pub_key

read -rep $'Please enther your ZeroTier network ID(default to empty):\n' zerotier_network_id

echo "Deploying a new devcontainer for $username"

lxc launch ubuntu-devcontainer ubuntu-devcontainer-$username
lxc exec ubuntu-devcontainer-$username -- systemctl is-system-running --wait

# create the new user
lxc exec ubuntu-devcontainer-$username -- useradd $username -u $(id -u) -m -s /bin/bash
# grant password-less sudo
lxc exec ubuntu-devcontainer-$username -- bash -ilc "echo \"$username ALL=(ALL) NOPASSWD:ALL\" > /etc/sudoers.d/$username"
lxc exec ubuntu-devcontainer-$username -- usermod -aG docker $username

# copy .gitconfig
lxc exec ubuntu-devcontainer-$username -- cp /root/.gitconfig /home/$username/.gitconfig
lxc exec ubuntu-devcontainer-$username -- chown $username:$username /home/$username/.gitconfig

# Generate SSH pub/priv key
lxc exec ubuntu-devcontainer-$username --user $(id -u) --group $(id -g) -- bash -ilc "ssh-keygen -t rsa -b 4096 -f /home/$username/.ssh/id_rsa -q -N ''"

# Add SSH public key
if [ ! -z "$ssh_pub_key" ]
then
    lxc exec ubuntu-devcontainer-$username --user $(id -u) --group $(id -g) -- bash -ilc "echo $ssh_pub_key > ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
fi

# Activate conda base
lxc exec ubuntu-devcontainer-$username --user $(id -u) --group $(id -g) -- bash -ilc "sudo usermod -aG conda $username && /opt/anaconda3/bin/conda init && echo 'conda activate base' >> ~/.bashrc"
# Configure jupyter
lxc exec ubuntu-devcontainer-$username --user $(id -u) --group $(id -g) -- bash -ilc "mkdir -p ~/.jupyter"
lxc file push config/jupyter_lab_config.json ubuntu-devcontainer-$username/home/$username/.jupyter/jupyter_lab_config.json

# configure ZeroTier
if [ ! -z "$zerotier_network_id" ]
then
    # reset ZeroTier address, see https://zerotier.atlassian.net/wiki/spaces/SD/pages/327693/How+to+Clear+Reset+your+ZeroTier+Address
    lxc exec ubuntu-devcontainer-$username -- bash -ilc "systemctl stop zerotier-one && rm /var/lib/zerotier-one/identity.* && systemctl start zerotier-one"
    lxc exec ubuntu-devcontainer-$username -- bash -ilc "zerotier-cli join $zerotier_network_id && zerotier-cli set $zerotier_network_id allowDNS=1"
fi

# for shared folder and docker
lxc config set ubuntu-devcontainer-$username security.privileged true
lxc config set ubuntu-devcontainer-$username security.nesting true
lxc restart ubuntu-devcontainer-$username

# limit the size of root disk
sudo zfs set quota=16G dpool/lxd/containers/ubuntu-devcontainer-$username

# attach to the container
lxc exec ubuntu-devcontainer-$username -- sudo --login --user $username
