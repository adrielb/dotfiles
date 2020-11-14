#!/bin/bash
. ./logger.sh

APPDIR=${APPS}/tmux
if [ ! -d "$APPDIR" ]; then
  git clone git@github.com:tmux/tmux.git ${APPDIR}
fi

cd $APPDIR
git fetch
git co 3.2-rc
git cleanup
sh autogen.sh
./configure
make -j$NUM_PROCS
sudo make install
tmux -V

exit 0


#######################################################################
#                                repl                                 #
#######################################################################


cd ~/apps/tmux

git fetch
git tags
