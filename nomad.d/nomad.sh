#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

# https://github.com/hashicorp/nomad/releases
# https://www.nomadproject.io/downloads

VER=1.0.4

mkdir -p /tmp/nomad
cd /tmp/nomad

wget --no-clobber https://releases.hashicorp.com/nomad/$VER/nomad_${VER}_linux_amd64.zip

wget --no-clobber https://releases.hashicorp.com/nomad/$VER/nomad_${VER}_SHA256SUMS

sha256sum --check --ignore-missing *_SHA256SUMS

unzip nomad*zip

cp nomad ~/apps/local/bin

nomad --version

exit 0


######################################################
# The nomad command features opt-in autocompletion for
# flags, subcommands, and arguments (where supported).
# Enable autocompletion:

nomad -autocomplete-install

# appends to bashrc:
# complete -C /home/abergman/apps/local/bin/nomad nomad


# Create a data directory for Nomad

mkdir -p ~/nomad


# the systemd service can't be run as a --user service
sudo cp nomad.service /etc/systemd/system/
sudo systemctl enable nomad


# reboot or start, check logs:
sudo journalctl --boot nomad
sudo systemctl start nomad
