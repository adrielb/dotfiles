#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

APPS=~/apps/

cd ${APPS}
if [ ! -d "git" ]; then
	git clone https://github.com/git/git 
fi
cd git
git fetch
git co v2.8.0
make clean
make -j$NUM_PROCS prefix=${APPS}/local all
make -j prefix=${APPS}/local install

