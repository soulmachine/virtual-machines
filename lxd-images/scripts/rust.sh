#!/bin/bash
# see: https://github.com/rust-lang/rustup/issues/2383
echo "#################### Install Rust ####################"
export RUSTUP_HOME=/opt/rust/rustup
export CARGO_HOME=/opt/rust/cargo
mkdir -p $RUSTUP_HOME
mkdir -p $CARGO_HOME

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path --default-toolchain nightly --component rust-src --component rust-analyzer-preview

echo "export RUSTUP_HOME=$RUSTUP_HOME" >> /etc/profile
echo "export PATH=\$PATH:$CARGO_HOME/bin" >> /etc/profile

/opt/rust/cargo/bin/cargo install cargo-edit
