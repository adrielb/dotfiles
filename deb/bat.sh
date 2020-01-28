#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

VERSION=v0.12.1
mkdir -p /tmp/bat
cd /tmp/bat

wget https://github.com/sharkdp/bat/releases/download/$VERSION/bat-$VERSION-x86_64-unknown-linux-musl.tar.gz

tar xvf bat*.tar.gz

rm bat*.tar.gz

cd bat*

mv bat ~/apps/local/bin

bat --version

