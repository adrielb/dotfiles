#!/bin/bash
. ./logger.sh

APPDIR=${APPS}/mxnet
if [ ! -d "$APPDIR" ]; then
  git clone https://github.com/dmlc/mxnet.git  ${APPDIR} --recursive
fi

cd $APPDIR
git fetch
make -j$NUM_PROCS

cd python
python  setup.py develop --user
python3 setup.py develop --user

