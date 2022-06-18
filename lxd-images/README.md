# ubuntu-devcontainer

A devcontainer for software engineers.

## How to deploy a container for a new user

### 1. Build the `ubuntu-devcontainer` image

Edit the `variables` section of `ubuntu-devcontainer.json`, and run `packer build ubuntu-devcontainer.json` to build the image.
First, launch a new container,

### 2. Run `deploy.sh`

### 3. More Configuration

First, attach to the running container:

```bash
lxc exec ubuntu-devcontainer-$username -- sudo --login --user $username
```

Second, put user's SSH public key to `~/.ssh/authorized_keys`, and run `chmod 600 ~/.ssh/authorized_keys`.

Tell the ZeroTier priate IP address to the user, then he can SSH into the container by running `ssh $username@zerotier-ip`.
