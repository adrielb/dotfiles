#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing


VERSION=0.10.0

mkdir /tmp/aw
cd /tmp/aw

wget --no-clobber https://github.com/ActivityWatch/activitywatch/releases/download/v$VERSION/activitywatch-v$VERSION-linux-x86_64.zip

cd ~/apps

if [ -d "activitywatch" ]; then
  mv activitywatch{,.bak}
fi

unzip /tmp/aw/activitywatch-v$VERSION-linux-x86_64.zip
