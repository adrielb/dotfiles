#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

VERSION=8.0.0

mkdir -pv /tmp/fd

cd /tmp/fd

wget --no-clobber https://github.com/sharkdp/fd/releases/download/v${VERSION}/fd-musl_${VERSION}_amd64.deb

sudo apt install ./*.deb
