#!/bin/bash
tmux capture-pane -p -S -20 -J | awk -v RS='julia> ' 'BEGIN { ORS=RS }  {b=a; a=$$0}  END { print "BASE: /home/abergman/apps/julia-bin/current/share/julia/base\njulia> "b }'
