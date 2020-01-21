#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

cd ~/apps

git clone --recursive https://github.com/kornelski/pngquant.git

cd pngquant

git checkout 2.12.6

./configure --with-openmp=static

make

ln -srf pngquant ~/apps/local/bin
