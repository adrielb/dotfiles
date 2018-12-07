cd ~/apps

git clone https://github.com/harfbuzz/harfbuzz.git

cd harfbuzz

git co 2.2.0

./autogen.sh

./configure

make -j4

su -c 'make install'

