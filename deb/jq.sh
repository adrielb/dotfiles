#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing


JQ=~/apps/local/bin/jq

wget \
  -O $JQ \
  https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64

chmod u+x $JQ 
