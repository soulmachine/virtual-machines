#!/bin/bash
echo "#################### Install Go ####################"

GO_VERSION=$(curl -s https://go.dev/VERSION?m=text) \
 && curl -O https://dl.google.com/go/$GO_VERSION.linux-amd64.tar.gz \
 && tar -C /usr/local -xzf $GO_VERSION.linux-amd64.tar.gz \
 && rm $GO_VERSION.linux-amd64.tar.gz \
 && echo "export PATH=\$PATH:/usr/local/go/bin" >> /etc/profile
