#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

# https://wiki.qt.io/Building_Qt_5_from_Git

sudo apt-get build-dep qt5-default
sudo apt-get install libxcb-xinerama0-dev 
sudo apt-get install '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev

cd ~/apps

if [ ! -d "qt5" ]; then
  git clone git://code.qt.io/qt/qt5.git
fi

cd qt5

git co v6.0.0
perl init-repository

mkdir qt5-build
cd qt5-build
../configure
cmake --build . --parallel
