#!/bin/bash
. ./logger.sh

APPDIR=${APPS}/tmux
if [ ! -d "$APPDIR" ]; then
  git clone git@github.com:tmux/tmux.git ${APPDIR}
fi

cd $APPDIR
git co 2.6
git cleanup
sh autogen.sh
./configure
make -j$NUM_PROCS
su -c 'make install'
tmux -V
