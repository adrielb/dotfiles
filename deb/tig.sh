#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

cd ~/apps

if [ ! -d "tig" ]; then
  git clone git@github.com:jonas/tig.git
fi

cd tig

git co tig-2.5.1

make configure

./configure prefix=~/apps/local/ 

make -j$(nproc)

make install
