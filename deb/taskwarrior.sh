# https://github.com/GothenburgBitFactory/taskwarrior
. ./logger.sh

TWDIR=${APPS}/taskwarrior
if [ ! -d "${TWDIR}" ]; then
  git clone https://github.com/GothenburgBitFactory/taskwarrior.git ${TWDIR}
fi

# apt-get install libgnutls28-dev uuid-dev

cd ${TWDIR}
git fetch
git taglatest
cmake \
  -DCMAKE_BUILD_TYPE=release . \
  -DCMAKE_INSTALL_PREFIX:PREFIX=${APPS}/local
make -j$NUM_PROCS
make install

task --version
