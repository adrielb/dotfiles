#!/bin/bash
. ./logger.sh

APPDIR=${APPS}/julia
if [ ! -d "$APPDIR" ]; then
  git clone git://github.com/JuliaLang/julia.git ${APPDIR}
fi

cd ${APPDIR}
git fetch
git co v0.4.5
make -j$NUM_PROCS

julia packages.jl
