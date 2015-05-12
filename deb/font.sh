#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

mkdir =p ~/.fonts
cp ../fonts/DroidSansMonoSlashed.ttf ~/.fonts/
fc-cache -f -v

