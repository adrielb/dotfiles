#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing


RELEASE='3.31.1-r1'

cd /tmp

wget --no-clobber https://github.com/rogerbinns/apsw/releases/download/$RELEASE/apsw-$RELEASE.zip

unzip apsw-$RELEASE.zip

cd apsw-$RELEASE

python3 setup.py fetch --missing-checksum-ok --all \
  build --enable-all-extensions \
  install --user \
  test


python3 -c '
import apsw
print( "apsw:   ", apsw.apswversion())
print( "sqlite: ", apsw.sqlitelibversion())
conn = apsw.Connection(":memory:")
cursor = conn.cursor()
cursor.execute("CREATE VIRTUAL TABLE testing USING fts5(data);")
cursor.execute("SELECT json(?)", (1337,)).fetchone()
'
