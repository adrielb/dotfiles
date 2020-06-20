#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

sudo apt-get install xsltproc libxml2-utils libidn11-dev

cd ~/apps

git clone git@github.com:neomutt/neomutt.git

cd neomutt

git co 20200619

./configure --disable-doc

make -j8

sudo make install
