#!/bin/bash
. ./logger.sh

APPDIR=${APPS}/tmux-mem-cpu-load
if [ ! -d "$APPDIR" ]; then
  git clone git://github.com/thewtex/tmux-mem-cpu-load.git ${APPDIR}
fi

cd ${APPDIR}
git co v3.2.2
cmake -DCMAKE_INSTALL_PREFIX:PREFIX=${APPS}/local .
make
make install
