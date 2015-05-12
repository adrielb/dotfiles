#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

APPS=~/apps/
if [ ! -d "${APPS}/tmux" ]; then
  git clone git@github.com:ThomasAdam/tmux.git ${APPS}/tmux
fi
cd $APPS/tmux
git co 2.0
git cleanup
sh autogen.sh
./configure
make -j$NUM_PROCS
su -c 'make install'
