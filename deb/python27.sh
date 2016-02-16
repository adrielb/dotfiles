#!/usr/bin/env bash
. ./logger.sh

APPSDIR=${APPS}/python27

mkdir $APPSDIR
cd $APPSDIR

LINK=https://www.python.org/ftp/python/2.7.11/Python-2.7.11.tar.xz

PYTHON=${LINK##*/}

if [ ! -f "$PYTHON" ]; then
  wget $LINK
fi

tar xf $PYTHON

cd ${PYTHON%.tar.xz}

./configure --prefix=${APPSDIR}/local

make -j$NUM_PROCS

make test

make install
