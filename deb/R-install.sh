#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

APPS=~/apps/
LOGR=`pwd`
RFILE=R-3.3.3
mkdir -p ${APPS}/R-cran
cd ${APPS}/R-cran
wget https://cran.r-project.org/src/base/R-3/$RFILE.tar.gz
tar -xf $RFILE.tar.gz
cd $RFILE
./configure --enable-R-shlib
make -j$NUM_PROCS
make check
ln -sf ${APPS}/R-cran/$RFILE/bin/R ${APPS}/local/bin
R CMD BATCH --no-init-file ${LOGR}/R-packages.R ${LOGR}/logs/R-`date '+%F-%T'`.log
R --version
