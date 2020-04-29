#!/usr/bin/env bash

cd deb

NAME=dotfiles

if tmux has-session -t $NAME; then
  tmux kill-session -t $NAME
else
  tmux new-session ${DETACH+-d} -s $NAME \; \
    new-window -n 'bashr' \; \
      send-keys 'su -' C-m \; \
    new-window -n 'borgmatic.log' \; \
      send-keys 'journalctl --user --follow --unit borgmatic' C-m \; \
      split-window \; \
      send-keys 'journalctl --user --follow --unit borgmatic-weekly' C-m \;
fi

