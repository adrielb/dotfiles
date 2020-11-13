#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

# https://golang.org/dl/

VERSION=1.15.5

cd /tmp

wget --no-clobber https://golang.org/dl/go$VERSION.linux-amd64.tar.gz

sudo tar -C /usr/local -xzf go$VERSION.linux-amd64.tar.gz

go version

exit 0

# add to ~/.profile:
export PATH="/usr/local/go/bin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin
