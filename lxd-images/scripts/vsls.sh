#!/bin/bash
echo "#################### Install Linux prerequisites for vscode Live share ####################"

# see https://docs.microsoft.com/en-us/visualstudio/liveshare/reference/linux
wget -O ~/vsls-reqs https://aka.ms/vsls-linux-prereq-script && chmod +x ~/vsls-reqs && ~/vsls-reqs && rm ~/vsls-reqs
