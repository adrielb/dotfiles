#!/bin/bash
source ./logger.sh

cd ${APPS}
if [ ! -d "git" ]; then
	git clone https://github.com/git/git 
fi
cd git
git fetch
git co v2.24.0
make clean
make -j$NUM_PROCS prefix=${APPS}/local all
make -j prefix=${APPS}/local install
git --version
