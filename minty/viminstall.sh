#!/bin/bash -xe

hg pull -u
hg update --clean

./configure \
  --with-features=huge \
  --enable-cscope \
  --enable-pythoninterp \
  --enable-tclinterp \
  --enable-luainterp \
  --enable-rubyinterp \
  --enable-gui=gtk2 \
  --enable-fail-if-missing \
  --prefix=/apps

make clean
make -j16
make install
vim --version
