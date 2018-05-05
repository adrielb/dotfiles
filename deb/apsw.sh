RELEASE='3.22.0-r1'

cd /tmp

wget https://github.com/rogerbinns/apsw/releases/download/$RELEASE/apsw-$RELEASE.zip

unzip apsw-$RELEASE.zip

cd apsw-$RELEASE

python3 setup.py fetch --all \
  build --enable-all-extensions \
  install --user \
  test
