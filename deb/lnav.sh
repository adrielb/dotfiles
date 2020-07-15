#!/usr/bin/env bash
. ./logger.sh

APPDIR=${APPS}/lnav
if [ ! -d "$APPDIR" ]; then
  git clone git://github.com/tstack/lnav.git ${APPDIR}
fi

cd ${APPDIR}
git fetch

stopLog
git new
startLog

git co v0.8.5

sh autogen.sh
./configure --prefix=${APPS}/local
make clean
make -j$NUM_PROCS
make install

