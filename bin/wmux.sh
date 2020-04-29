#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

export DETACH=

tmux new-session -d -s 'vim' nvim

cd ~/projects/dotfiles; ./tmux.sh
cd ~/projects/valuation; ./tmux.sh
cd ~/projects/learnpython; ./tmux.sh
