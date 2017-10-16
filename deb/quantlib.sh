
cd ~/apps

git clone https://github.com/lballabio/quantlib.git

cd ~/apps/quantlib

git co QuantLib-v1.11

sh autogen.sh

./configure

make -j 4
