#!/usr/bin/env bash
. ./logger.sh

APPSDIR=${APPS}/jags

mkdir $APPSDIR
cd $APPSDIR

JAGS=JAGS-4.0.1.tar.gz

tar xf ~/Downloads/${JAGS}

cd ${JAGS%.tar.gz}

./configure --prefix=/home/abergman/apps/local

make -j$NUM_PROCS

make check

make install

