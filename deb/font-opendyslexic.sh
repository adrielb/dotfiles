#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

mkdir /tmp/opendys
cd /tmp/opendys

wget --no-clobber https://github.com/antijingoist/opendyslexic/releases/download/v0.91.12/opendyslexic-0.910.12-rc2-2019.10.17.zip

unzip opendyslexic*.zip

chmod u+r *.otf

cp *.otf ~/.fonts/

fc-cache --force --verbose
