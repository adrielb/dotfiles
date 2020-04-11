#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

VERSION=v2.1.6

mkdir -p /tmp/nats
cd /tmp/nats

wget https://github.com/nats-io/nats-server/releases/download/$VERSION/nats-server-$VERSION-linux-amd64.zip

unzip nats-server-$VERSION-linux-amd64.zip

cd nats-server-$VERSION-linux-amd64

mv nats-server ~/apps/local/bin

nats-server --version
