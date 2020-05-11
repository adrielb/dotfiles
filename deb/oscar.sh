#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing



cd /tmp

wget --no-clobber https://www.apneaboard.com/OSCAR/oscar_1.1.0-Debian9_amd64.deb

sudo apt install ./oscar_*.deb

exit 0


# code
cd ~/apps/

git clone https://gitlab.com/pholy/OSCAR-code.git
