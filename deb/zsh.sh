#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executingo

APPS=~/apps/

ZSHDIR=${APPS}/zsh
if [ ! -d "$ZSHDIR" ]; then
  git clone git@github.com:zsh-users/zsh.git ${ZSHDIR}
fi

cd ${ZSHDIR}
git co zsh-5.0.7
git cleanup
./Util/preconfig
./configure
make -j$NUM_PROCS
make check
su -c 'make install'
