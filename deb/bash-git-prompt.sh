#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

BASHGITPROMPTDIR=~/.bash-git-prompt
if [ ! -d "$BASHGITPROMPTDIR" ]; then
  git clone git@github.com:adrielb/bash-git-prompt.git ${BASHGITPROMPTDIR}
fi
