#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

mkdir /tmp/caddy
cd /tmp/caddy

wget --no-clobber "https://github.com/caddyserver/caddy/releases/download/v2.1.1/caddy_2.1.1_linux_amd64.tar.gz"

tar zxvf caddy*.tar.gz
cp caddy ~/apps/local/bin

caddy version
