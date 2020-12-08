#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

# https://github.com/hashicorp/nomad/releases
# https://www.nomadproject.io/downloads

mkdir -p /tmp/nomad
cd /tmp/nomad

wget --no-clobber https://releases.hashicorp.com/nomad/1.0.0/nomad_1.0.0_linux_amd64.zip

wget --no-clobber https://releases.hashicorp.com/nomad/1.0.0/nomad_1.0.0_SHA256SUMS

sha256sum --check --ignore-missing *_SHA256SUMS

unzip nomad*zip

cp nomad ~/apps/local/bin

nomad --version
