#!/bin/bash
source ./logger.sh

# apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev

APPDIR=~/apps/the_silver_searcher
if [ ! -d "$APPDIR" ]; then
  git clone https://github.com/ggreer/the_silver_searcher.git ${APPDIR}
fi

cd ${APPDIR}

git fetch

git co 2.2.0

./build.sh

su -c 'make install'

