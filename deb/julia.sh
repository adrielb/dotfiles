#!/bin/bash
. ./logger.sh

APPDIR=${APPS}/julia
if [ ! -d "$APPDIR" ]; then
  git clone git://github.com/JuliaLang/julia.git ${APPDIR}
fi

cd ${APPDIR}
git co v0.4.2
make -j$NUM_PROCS

julia -e 'Pkg.update()'
