#!/bin/bash
# always put this as the last provisioner
echo "#################### Shink disks ####################"
sudo vmware-toolbox-cmd disk shrink /
