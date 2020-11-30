#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

mkdir /tmp/iosevka
cd /tmp/iosevka

wget --no-clobber https://github.com/be5invis/Iosevka/releases/download/v3.0.1/ttf-iosevka-fixed-3.0.1.zip

unzip ttf-iosevka*.zip

cp ttf/iosevka-fixed-regular.ttf ~/.fonts/

fc-cache --force --verbose
