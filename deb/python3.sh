#!/usr/bin/env bash
. ./logger.sh

APPSDIR=${APPS}/python3

mkdir -p $APPSDIR
cd $APPSDIR

VERSION="3.7.4"

LINK=https://www.python.org/ftp/python/$VERSION/Python-$VERSION.tar.xz

PYTHON=${LINK##*/}

if [ ! -f "$PYTHON" ]; then
  wget $LINK
fi

tar xf $PYTHON

cd ${PYTHON%.tar.xz}

./configure \
  --enable-shared \
  --enable-optimizations
make -j$NUM_PROCS
# make test
su -c 'make install && ldconfig'


# edit ~/.local/bin/pip3 to #!/usr/local/bin/python3.7
