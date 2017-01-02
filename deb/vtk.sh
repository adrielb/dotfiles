#!/bin/bash
. ./logger.sh

APPDIR=${APPS}/vtk
if [ ! -d "$APPDIR" ]; then
  git clone https://gitlab.kitware.com/vtk/vtk.git ${APPDIR}
  git clone git://vtk.org/VTKData.git ${APPDIR}data
fi

cd $APPDIR
git fetch
git co v7.1.0

ccmake . 

CMAKE_INSTALL_PREFIX
CMAKE_BUILD_TYPE=Release
VTK_WRAP_PYTHON=ON
VTK_PYTHON_VERSION=3
PYTHON_EXECUTABLE=/usr/local/bin/python3
PYTHON_INCLUDE_DIR=/usr/local/include/python3.5m
PYTHON_LIBRARY=/usr/local/lib/libpython3.5m.so


make
