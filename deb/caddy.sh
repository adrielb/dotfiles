#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

# https://github.com/caddyserver/caddy/releases

VERSION=2.3.0

mkdir /tmp/caddy
cd /tmp/caddy

wget --no-clobber "https://github.com/caddyserver/caddy/releases/download/v$VERSION/caddy_${VERSION}_linux_amd64.tar.gz"

tar zxvf caddy*.tar.gz
cp caddy ~/apps/local/bin

caddy version
