#!/bin/bash
source ./logger.sh

VERSION=7.8.4
# VERSION=7.10.1
GHCFILE=ghc-$VERSION-x86_64-unknown-linux-deb7.tar.xz 
GHCDIR=ghc-$VERSION

mkdir -p $APPS/ghc
cd $APPS/ghc

if [[ ! -f $GHCFILE ]]; then
  wget --no-verbose https://www.haskell.org/ghc/dist/$VERSION/$GHCFILE
fi

if [[ ! -d $GHCDIR ]]; then
  tar xf $GHCFILE
fi

cd $GHCDIR
./configure --prefix=$APPS/ghc/$GHCDIR
make -j$NUM_PROCS install

echo "Add to .bashrc:"
echo "export PATH=~/$APPS/ghc/$GHCDIR/bin:"'$PATH'

