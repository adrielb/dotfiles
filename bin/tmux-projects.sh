#!/usr/bin/env bash

NAME=vim

if tmux has-session -t $NAME; then
  tmux kill-session -t $NAME
else
  tmux new-session -A -s $NAME \; \
    new-window -n 'valuation' \; \
      send-keys 'cd ~/projects/valuation' C-m \; \
    new-window -n 'dotfiles' \; \
      send-keys 'cd ~/projects/dotfiles' C-m \; \
    new-window -n 'dotvim' \; \
      send-keys 'cd ~/projects/dotvim' C-m \; \
    select-window -t valuation
fi

