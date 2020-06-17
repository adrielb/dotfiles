#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing


mkdir /tmp/fossil
cd /tmp/fossil

wget --no-clobber https://www.fossil-scm.org/fossil/uv/fossil-linux-x64-2.11.1.tar.gz

tar zxvf fossil*.tar.gz

cp fossil ~/apps/local/bin
