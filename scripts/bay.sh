#!/usr/bin/env bash

cd ~/projects/barrestin/bayesian

if [[ $1 == "repl" ]]; then
  export TERM=xterm-256color
  tmux new R -q
else
  export DISPLAY=":0.1"
  gnome-terminal -x ~/bay.sh repl &
  export DISPLAY=":0.2"
  zathura ~/Downloads/barrestin.pdf &
  sleep 1
  nvim -c "normal gg g;zx" regression.R
  exec bash
fi

