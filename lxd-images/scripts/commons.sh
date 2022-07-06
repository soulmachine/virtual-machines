#!/bin/bash
echo "#################### Install Common Tools ####################"
sudo apt update

apt -qy --no-install-recommends install \
    apt-transport-https \
    build-essential \
    ca-certificates \
    curl \
    git \
    gpg \
    gpg-agent \
    htop \
    iputils-ping \
    jq \
    libssl-dev \
    locales \
    lsb-release \
    man \
    net-tools \
    openssh-client \
    openssh-server \
    pkg-config \
    procps \
    socat \
    software-properties-common \
    sudo \
    sysstat \
    tar \
    tmux \
    tcpdump \
    tree \
    tzdata \
    unzip \
    vim \
    wget \
    zip

git config --global pull.rebase true \
 && git config --global rebase.autoStash true \
 && git config --global credential.helper store
