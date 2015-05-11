#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing


if [ ! -h ~/.bashrc ]; then
  mv ~/.bashrc ~/.bashrc.orig
  ln -sf ~/projects/dotfiles/deb/bashrc.sh ~/.bashrc
fi
