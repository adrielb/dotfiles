#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing


# https://github.com/smallhadroncollider/taskell/releases

VER=1.11.0
FILE_GZ=taskell-${VER}_x86-64-linux.tar.gz

mkdir -p /tmp/taskell
cd /tmp/taskell

wget --no-clobber https://github.com/smallhadroncollider/taskell/releases/download/$VER/$FILE_GZ

tar xf $FILE_GZ

cp taskell ~/apps/local/bin

taskell -v
