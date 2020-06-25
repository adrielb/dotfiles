#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

cd ~/apps/
if [ ! -d "sc-im" ]; then
  git clone git@github.com:andmarti1424/sc-im.git
fi

cd sc-im

make -C src
