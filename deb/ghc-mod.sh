#!/usr/bin/env bash
source logger.sh

mkdir $APPS/ghc-mod
cd $APPS/ghc-mod
cabal sandbox init
cabal install -j alex happy ghc-mod hlint hoogle hdevtools
