#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

# https://github.com/be5invis/Iosevka/releases

mkdir -p /tmp/iosevka
cd /tmp/iosevka

VERSION="4.0.0"
                  
wget --no-clobber https://github.com/be5invis/Iosevka/releases/download/v$VERSION/ttf-iosevka-fixed-$VERSION.zip

unzip -f ttf-iosevka*.zip

cp iosevka-fixed-regular.ttf ~/.fonts/

fc-cache --force --verbose
