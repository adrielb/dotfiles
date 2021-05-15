#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

VERSION=1.4.2

mkdir /tmp/tw
cd /tmp/tw

wget --no-clobber https://github.com/GothenburgBitFactory/timewarrior/releases/download/v$VERSION/timew-${VERSION}.tar.gz

tar xzf timew-${VERSION}.tar.gz

cd timew-${VERSION}


# cd ~/apps

# if [ ! -d "timewarrior" ]; then
#   git clone --recurse-submodules https://github.com/GothenburgBitFactory/timewarrior.git
# fi

# cd timewarrior

# git fetch
# git co v1.4.2


cmake \
  -DCMAKE_BUILD_TYPE=release . \
  -DCMAKE_INSTALL_PREFIX=~/apps/local

make -j

make install

timew --version

exit 0

#######################################################################
#                                REPL                                 #
#######################################################################


tree ~/.timewarrior

bat ~/.timewarrior/timewarrior.cfg

timew
# There is no active time tracking.                           

timew continue   # restarts previous tracking

timew summary

timew help summary

timew summary :lastweek

timew summary :lastweek :ids

timew tags

# Historical (ex post facto)
timew track 

timew help interval

timew help date

timew help hints

timew help delete

# charts
timew day 8th

timew day 7th - now

timew day yesterday

timew week

timew help day

# extensions
timew extensions

timew diagnostics

timew :lastweek totals

timew help report

wget -P ~/.timewarrior/extensions \
  https://raw.githubusercontent.com/GothenburgBitFactory/timewarrior/dev/ext/totals.py
chmod u+x ~/.timewarrior/extensions/totals.py

timew show

# export
timew help export

timew export 1wks
