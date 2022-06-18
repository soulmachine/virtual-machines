#!/bin/bash
echo "#################### Install Ethereum and hardhat ####################"

echo "deb http://ppa.launchpad.net/ethereum/ethereum/ubuntu jammy main" > /etc/apt/sources.list.d/ethereum.list \
 && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 1C52189C923F6CA9 \
 && apt -qy update \
 && apt -qy install abigen \
 && wget https://github.com/ethereum/solidity/releases/download/v0.8.13/solc-static-linux -O /tmp/solc && chmod +x /tmp/solc && mv /tmp/solc /usr/local/bin/ \
 && npm install -g ts-node hardhat solhint surya prettier prettier-plugin-solidity solhint-plugin-prettier npm-check-updates
