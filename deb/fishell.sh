#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing


cd ~/apps

if [ ! -d "fish-shell" ]; then
  git clone https://github.com/fish-shell/fish-shell.git
fi

cd fish-shell

git taglatest

cmake -DCMAKE_INSTALL_PREFIX=~/apps/local .

make -j4

make install

fish --version
