#!/bin/bash
echo "#################### Install Linux prerequisites for vscode Live share ####################"

# see https://github.com/MicrosoftDocs/live-share/issues/4646
echo "deb http://security.ubuntu.com/ubuntu focal-security main" | sudo tee /etc/apt/sources.list.d/focal-security.list
sudo apt update
sudo apt -qy install libssl1.1

# see https://docs.microsoft.com/en-us/visualstudio/liveshare/reference/linux
wget -O ~/vsls-reqs https://aka.ms/vsls-linux-prereq-script && chmod +x ~/vsls-reqs && ~/vsls-reqs && rm ~/vsls-reqs

