#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

# https://github.com/hashicorp/nomad/releases

mkdir -p /tmp/nomad
cd /tmp/nomad

wget --no-clobber https://releases.hashicorp.com/nomad/0.11.3/nomad_0.11.3_linux_amd64.zip

unzip nomad*zip

cp nomad ~/apps/local/bin
