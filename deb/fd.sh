#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing


mkdir -pv /tmp/fd

cd !$

wget --no-clobber https://github.com/sharkdp/fd/releases/download/v8.0.0/fd-musl_8.0.0_amd64.deb

sudo apt install ./*.deb
