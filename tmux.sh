#!/usr/bin/env bash

cd deb

NAME=dotfiles

if tmux has-session -t $NAME; then
  tmux kill-session -t $NAME
else
  tmux new-session -A -s $NAME \; \
    send-keys '' C-m \;
fi

