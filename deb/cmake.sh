#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executingo

APPS=~/apps/

CMAKE=cmake-3.2.2
mkdir -p ${APPS}/cmake
cd ${APPS}/cmake
wget http://www.cmake.org/files/v3.2/${CMAKE}.tar.gz
tar zxvf ${CMAKE}.tar.gz
cd ${CMAKE}
cmake -DCMAKE_INSTALL_PREFIX:PREFIX=${APPS}/local .
make -j all
make install
