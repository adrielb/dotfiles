#!/bin/bash
. ./logger.sh

APPDIR=${APPS}/julia
if [ ! -d "$APPDIR" ]; then
  git clone git://github.com/JuliaLang/julia.git ${APPDIR}
fi

OLDPWD=`pwd`

cd ${APPDIR}
git fetch
git co v0.6.0-pre.alpha
make -j$NUM_PROCS

ctags-exuberant -R --languages=julia

cd ${OLDPWD}
julia packages.jl
