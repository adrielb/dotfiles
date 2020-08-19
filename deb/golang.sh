#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

VERSION=1.14.6

cd /tmp

wget --no-clobber https://golang.org/dl/go$VERSION.linux-amd64.tar.gz

sudo tar -C /usr/local -xzf go$VERSION.linux-amd64.tar.gz

exit 0

# add to ~/.profile:
export PATH="/usr/local/go/bin:$PATH"
