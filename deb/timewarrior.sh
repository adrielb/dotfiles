#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

VERSION=1.4.2

mkdir /tmp/tw
cd /tmp/tw

wget --no-clobber https://github.com/GothenburgBitFactory/timewarrior/releases/download/v$VERSION/timew-${VERSION}.tar.gz

tar xzf timew-${VERSION}.tar.gz

cd timew-${VERSION}


# cd ~/apps

# if [ ! -d "timewarrior" ]; then
#   git clone --recurse-submodules https://github.com/GothenburgBitFactory/timewarrior.git
# fi

# cd timewarrior

# git fetch
# git co v1.4.2


cmake \
  -DCMAKE_BUILD_TYPE=release . \
  -DCMAKE_INSTALL_PREFIX=~/apps/local

make -j

make install

timew --version
