#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

mkdir -p ~/projects
cd ~/projects

REPOLIST=`curl --silent "https://api.github.com/users/adrielb/repos" \
  | sed -n 's/\"ssh_url\": \"\(.*\)\",/\1/p'`

for REPO in $REPOLIST; do
  DIR=`basename $REPO .git`
  if [ ! -d $DIR ]; then
    git clone $REPO
  fi
done
