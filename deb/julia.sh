#!/bin/bash
. ./logger.sh

APPDIR=${APPS}/julia
if [ ! -d "$APPDIR" ]; then
  git clone git://github.com/JuliaLang/julia.git ${APPDIR}
fi

OLDPWD=`pwd`

cd ${APPDIR}
git fetch
git stash
git co v1.0.0
git stash pop
make -j$NUM_PROCS

ctags-exuberant -R --languages=julia

cd ${OLDPWD}
# julia packages.jl
