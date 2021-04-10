#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing


cd ~/apps

if [ ! -d "kitty" ]; then
  git clone https://github.com/kovidgoyal/kitty
fi

cd kitty

git co v0.19.3

# sudo apt-get install liblcms2-dev

make

ln -sfrv ./kitty/launcher/kitty ~/apps/local/bin

kitty --version
