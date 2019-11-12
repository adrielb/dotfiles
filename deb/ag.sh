

APPDIR=~/apps/the_silver_searcher
if [ ! -d "$APPDIR" ]; then
  git clone https://github.com/ggreer/the_silver_searcher.git ${APPDIR}
fi

cd ${APPDIR}

git fetch

git co 2.2.0

./build.sh

su -c 'make install'

