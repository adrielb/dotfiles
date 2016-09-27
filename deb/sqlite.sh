#!/bin/bash
. ./logger.sh

APPDIR=${APPS}/sqlite

mkdir -p ${APPDIR}

cd ${APPDIR}

LINK=https://sqlite.org/2016/sqlite-autoconf-3140200.tar.gz

SQLITE=${LINK##*/}

wget --no-check-certificate $LINK

tar zxvf $SQLITE

cd ${SQLITE%.tar.gz}

export CFLAGS="-fPIC"

./configure \
  --enable-fts5 \
  --enable-json1 \
  --prefix=/home/abergman/apps/local

make clean

make -j

make install

sqlite3 --verison
