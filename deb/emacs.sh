#!/bin/bash
source ./logger.sh

# deps: libXpm libgif libtiff

EMACSDIR=${APPS}/emacs

mkdir -p ${EMACSDIR}
cd ${EMACSDIR}

if [ ! -d "EMACSDIR" ]; then
  git clone git://git.savannah.gnu.org/emacs.git ${EMACSDIR}
fi

wget http://gnu.opencube.ca/emacs/emacs-24.5.tar.xz

tar xf 

sh autogen.sh

./configure --prefix=${APPS}/local

make -j${NUM_PROCS}

make install


