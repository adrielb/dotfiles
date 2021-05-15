#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

# https://fossil-scm.org/home/uv/download.html

VER=2.15.1
FOSSIL_GZ=fossil-linux-x64-$VER.tar.gz
URL=https://fossil-scm.org/home/uv/$FOSSIL_GZ

mkdir /tmp/fossil
cd /tmp/fossil

wget --no-clobber $URL

tar zxvf $FOSSIL_GZ

cp fossil ~/apps/local/bin

fossil version

exit 0


#######################################################################
#                                repl                                 #
#######################################################################

mkdir ~/fossil
cd ~/fossil

fossil init fossil.sqlite

fossil ui fossil.sqlite
# 8081

fossil serve fossil.sqlite
# 8080

datasette fossil.sqlite
# 8001


# Admin --> users --> abergman --> [make stronger password]
# Admin --> Security Audit --> Take it private
