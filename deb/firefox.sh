#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing


cd ~/apps

tar xvf ~/Downloads/firefox-76.0.tar.bz2

exit 0

# old install:
# https://mozilla.debian.net/

# /etc/apt/sources.list
deb http://mozilla.debian.net/ jessie-backports firefox-release

apt-get update
apt-get install -t jessie-backports firefox
