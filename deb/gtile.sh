#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing


git clone https://github.com/gTile/gTile.git ~/.local/share/gnome-shell/extensions/gTile@vibou
