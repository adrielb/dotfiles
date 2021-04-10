#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

VER=0.8.8
OIL_XZ="oil-$VER.tar.xz"
URL="https://www.oilshell.org/download/$OIL_XZ"

mkdir -p /tmp/oilshell
cd /tmp/oilshell

wget --no-clobber $URL

tar -x --xz < $OIL_XZ

cd oil-$VER

./configure --prefix ~/apps/local

make

./install

osh --version
