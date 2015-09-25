#!/usr/bin/env bash
source logger.sh

cd ${APPS}
if [ ! -d "git" ]; then
  git clone https://github.com/stan-dev/cmdstan.git
fi
cd cmdstan/
git fetch
git co v2.8.0
make clean
make stan-update
make -j$NUM_PROCS build
