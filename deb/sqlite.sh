#!/bin/bash
. ./logger.sh

APPDIR=${APPS}/sqlite

mkdir ${APPDIR}

cd ${APPDIR}

SQLITE=sqlite-autoconf-3090200

wget http://www.sqlite.org/2015/${SQLITE}.tar.gz

tar zxvf ${SQLITE}.tar.gz

cd $SQLITE

./configure --enable-fts5 --enable-json1

make clean

make -j
