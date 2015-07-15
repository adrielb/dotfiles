setlocal autochdir

augroup reload_tmuxconf " {
  autocmd!
  autocmd BufWritePost tmux.conf :!tmux source-file ~/.tmux.conf\; display-message Reloaded\!
augroup END " }
