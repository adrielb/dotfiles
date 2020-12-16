#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

# https://github.com/jarun/nnn/releases

mkdir -p /tmp/nnn
cd /tmp/nnn

wget --no-clobber https://github.com/jarun/nnn/releases/download/v3.5/nnn_3.5-1_debian9.amd64.deb

sudo apt install ./nnn*.deb
