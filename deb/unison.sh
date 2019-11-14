#!/bin/bash
source ./logger.sh

APPDIR=~/apps/unison
if [ ! -d "$APPDIR" ]; then
	git clone https://github.com/bcpierce00/unison.git ${APPDIR}
fi

cd ${APPDIR}

git pull

make -j${NUM_PROCS}

cd ${APPS}/local/bin

ln -sf ../../unison/src/unison .
