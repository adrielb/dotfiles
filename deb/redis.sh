#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

VERSION=5.0.8

cd /tmp

wget http://download.redis.io/releases/redis-$VERSION.tar.gz

tar xzf redis-$VERSION.tar.gz

cd redis-$VERSION

make

cp src/redis-* ~/apps/local/bin

redis-server --version
