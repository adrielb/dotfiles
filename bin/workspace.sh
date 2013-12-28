tmux new-session -d -s 'root'
tmux send-keys 'su -' C-m
tmux new-session -d -s 'music'
tmux send-keys 'cd ~/Music'
tmux new-session -d -s 'dotfiles' 
tmux send-keys 'cd ~/projects/dotfiles' C-m
tmux new-session -d -s 'barrestin' 
tmux send-keys 'cd ~/projects/barrestin/python' C-m
tmux attach
