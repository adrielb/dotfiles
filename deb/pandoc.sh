LINK=https://github.com/jgm/pandoc/releases/download/2.0.4/pandoc-2.0.4-linux.tar.gz
TGZ=${LINK##*/}
DEST=~/apps/local

cd /tmp
wget $LINK
tar xvzf $TGZ --strip-components 1 -C $DEST
