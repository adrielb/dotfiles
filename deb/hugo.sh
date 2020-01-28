#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing


# https://github.com/gohugoio/hugo/releases

VERSION=0.63.2

mkdir -p /tmp/hugo
cd /tmp/hugo

URL=https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Linux-64bit.tar.gz

wget --no-clobber $URL

tar zxvf hugo*.tar.gz

hash hugo && hugo version || echo 'new install'

mv hugo ~/.local/bin

hugo version
