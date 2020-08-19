let g:slime_python_ipython = 1

augroup reload_tmuxconf " {
  autocmd!
  autocmd BufWritePost tmux.conf :!tmux source-file ~/.tmux.conf\; display-message Reloaded\!
augroup END " }
