#!/usr/bin/env bash
. ./logger.sh

APPSDIR=${APPS}/python3

mkdir $APPSDIR
cd $APPSDIR

LINK=https://www.python.org/ftp/python/3.5.1/Python-3.5.1.tar.xz

PYTHON=${LINK##*/}

if [ ! -f "$PYTHON" ]; then
  wget $LINK
fi

tar xf $PYTHON

cd ${PYTHON%.tar.xz}

./configure
make -j$NUM_PROCS
make test
su -c 'make install'

pip install --upgrade pip
