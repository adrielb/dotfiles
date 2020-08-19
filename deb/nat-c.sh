
git clone ...

cd ~/apps/nats.c

git co v2.2.0

rm -rf build

mkdir build

cd build

cmake .. -DNATS_BUILD_STREAMING=OFF

make -j
