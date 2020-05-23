#!/bin/bash
# https://sqlite.org/download.html
. ./logger.sh

APPDIR=${APPS}/sqlite

mkdir -p ${APPDIR}

cd ${APPDIR}

LINK=https://sqlite.org/2020/sqlite-autoconf-3320000.tar.gz

SQLITE=${LINK##*/}

wget --no-clobber --no-check-certificate $LINK

tar zxvf $SQLITE

cd ${SQLITE%.tar.gz}

export CFLAGS="-fPIC"

./configure \
  --enable-fts5 \
  --enable-json1 \
  --disable-static \
  --prefix=/home/abergman/apps/local

make clean

make -j

make install

sqlite3 --verison
