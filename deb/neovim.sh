#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

APPS=~/apps/

NEOVIMDIR=${APPS}/neovim
if [ ! -d "$NEOVIMDIR" ]; then
  git clone git@github.com:neovim/neovim.git  ${NEOVIMDIR}
fi

cd ${NEOVIMDIR}
git fetch
git log HEAD..origin --oneline
git rebase
rm -rf build/ .deps
make clean
make -j4 CMAKE_BUILD_TYPE=Release
su -c 'make install'
