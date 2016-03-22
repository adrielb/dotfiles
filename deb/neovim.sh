#!/bin/bash
. ./logger.sh

NEOVIMDIR=${APPS}/neovim
if [ ! -d "$NEOVIMDIR" ]; then
  git clone git@github.com:neovim/neovim.git  ${NEOVIMDIR}
  pip install neovim
fi

cd ${NEOVIMDIR}
git fetch
stopLog
git log HEAD..origin --oneline
startLog
git rebase
rm -rf build/ .deps
make clean
make -j$NUM_PROCS CMAKE_BUILD_TYPE=Release
su -c 'make install && pip install --upgrade neovim'
stopLog
nvim +PlugUpdate
