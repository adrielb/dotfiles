#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing


cd /tmp
git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized
./install.sh


echo "Need to change pallate color #9 since it's too black vs background"
echo "#5B6264"
