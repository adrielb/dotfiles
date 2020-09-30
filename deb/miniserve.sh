#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing


cd /tmp

wget --no-clobber https://github.com/svenstaro/miniserve/releases/download/v0.8.0/miniserve-v0.8.0-linux-x86_64

m=(miniserve-*)
m="${m[0]}"

chmod u+x

mv $m ~/apps/local/bin/miniserve

chmod u+x ~/apps/local/bin/miniserve

miniserve --version
