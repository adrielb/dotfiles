#!/usr/bin/env bash

NAME=`basename $PWD`

if tmux has-session -t $NAME; then
  tmux kill-session -t $NAME
else
  tmux new-session -A -s $NAME \; \
    new-window -n 'julia' \; \
      send-keys 'retry.sh julia' C-m \; \
    new-window -n 'ipython' \; \
      send-keys 'retry.sh ipython3' C-m \; \
    new-window -n 'sqlite' \; \
      send-keys 'sqlite3 data.db' \; \
    select-window -t ipython
fi

