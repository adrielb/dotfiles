#!/usr/bin/env bash

APPSDIR=${APPS}/python27

mkdir $APPSDIR
cd $APPSDIR

LINK=https://www.python.org/ftp/python/2.7.11/Python-2.7.11.tar.xz

PYTHON=${LINK##*/}

wget $LINK

tar xvf $PYTHON

cd ${PYTHON%.tar.xz}


