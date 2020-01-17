#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

mkdir -p /tmp/mdcat
cd /tmp/mdcat

wget https://github.com/lunaryorn/mdcat/releases/download/mdcat-0.15.0/mdcat-0.15.0-x86_64-unknown-linux-musl.tar.gz

tar xvf mdcat*.tar.gz

rm mdcat*.tar.gz

cd mdcat*

mv mdcat ~/apps/local/bin

