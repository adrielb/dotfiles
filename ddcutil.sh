mkdir /tmp/dcc
cd /tmp/dcc
wget --no-clobber https://github.com/rockowitz/ddcutil/archive/v0.9.9.tar.gz

tar zxvf v0.9.9.tar.gz

cd ddcutil*

sudo apt-get install libudev-dev libusb-1.0-0-dev

./autogen.sh

make

sudo make install
