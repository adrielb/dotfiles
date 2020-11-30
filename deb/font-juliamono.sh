#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

# https://github.com/cormullion/juliamono/releases

D=/tmp/juliamono
mkdir -p $D
cd $D

wget --no-clobber https://github.com/cormullion/juliamono/releases/download/v0.027/JuliaMono.tar.gz

tar zxvf JuliaMono.tar.gz

cp *.ttf ~/.fonts/

fc-cache --force --verbose
