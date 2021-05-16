#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

VERSION=0.22.4

mkdir -p /tmp/mdcat
cd /tmp/mdcat

wget --no-clobber https://github.com/lunaryorn/mdcat/releases/download/mdcat-$VERSION/mdcat-$VERSION-x86_64-unknown-linux-musl.tar.gz

tar xvf mdcat*.tar.gz

rm mdcat*.tar.gz

cd mdcat*

mv mdcat ~/apps/local/bin

mdcat --version
