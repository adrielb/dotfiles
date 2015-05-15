#!/usr/bin/env bash
source logger.sh

CABALDIR=/tmp/cabal
git clone git://github.com/haskell/cabal.git $CABALDIR
cd $CABALDIR
git co Cabal-v1.22.2.0  
cd Cabal
ghc -threaded --make Setup
./Setup configure --user
./Setup build
./Setup install
cd ../cabal-install
./bootstrap.sh
cabal update
cabal --version
cabal install cabal cabal-install
