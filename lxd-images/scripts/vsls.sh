#!/bin/bash
echo "#################### Install Linux prerequisites for vscode Live share ####################"

# see https://docs.microsoft.com/en-us/visualstudio/liveshare/reference/linux
wget -O ~/vsls-reqs https://aka.ms/vsls-linux-prereq-script && chmod +x ~/vsls-reqs && ~/vsls-reqs && rm ~/vsls-reqs

# see https://github.com/MicrosoftDocs/live-share/issues/4646
echo "deb http://security.ubuntu.com/ubuntu impish-security main" | sudo tee /etc/apt/sources.list.d/impish-security.list
sudo apt update
sudo apt -qy install libssl1.1
