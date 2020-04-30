#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

VERSION=6.0.0

cd /tmp

wget --no-clobber http://download.redis.io/releases/redis-$VERSION.tar.gz

tar xzf redis-$VERSION.tar.gz

cd redis-$VERSION

make -j

REDIS=$(find src/ -type f -executable -name 'redis-*')

cp $REDIS ~/apps/local/bin

redis-server --version
