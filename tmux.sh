#!/usr/bin/env bash

cd deb

NAME=dotfiles

if tmux has-session -t $NAME; then
  tmux kill-session -t $NAME
else
  tmux new-session -A -s $NAME \; \
    new-window -n 'bashr' \; \
      send-keys 'su -' C-m \; \
    new-window -n 'borgmatic.log' \; \
      send-keys 'tail -F ~/log/borgmatic.log' C-m \;
fi

