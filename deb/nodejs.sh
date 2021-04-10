#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing


VER="14.16.1"
NODEXZ="node-v"$VER"-linux-x64.tar.xz"

cd ~/apps/nodejs

wget --no-clobber https://nodejs.org/dist/v$VER/$NODEXZ

tar xf $NODEXZ --skip-old-files

ln -sfv ${NODEXZ%.tar.xz} current

ln -sfv --relative current/bin/npm ~/apps/local/bin
ln -sfv --relative current/bin/npx ~/apps/local/bin
ln -sfv --relative current/bin/node ~/apps/local/bin

exit 0


npm install --global npm

npm update --global




npm install npm@latest -g

npm update -g .



npm update --global

npm install --global tern

npm install --global jshint

npm install --global eslint

npm install --global gulp
npm install --global gulp-cli

npm list --global

npm ls --global minimatch
npm ls --global minimatch@0.3.0
npm ls --global minimatch@0.2.14

npm install --global minimatch

npm outdated --global 
