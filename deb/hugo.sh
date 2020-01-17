#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing


# https://github.com/gohugoio/hugo/releases

VERSION=0.62.2

cd /tmp

URL=https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Linux-64bit.tar.gz

wget $URL

tar zxvf *.tar.gz

hugo version

mv hugo ~/.local/bin

hugo version

