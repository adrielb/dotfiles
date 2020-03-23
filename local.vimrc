let b:auBufEnter='autocmd BufEnter ' . expand('<sfile>:p:h')
augroup switchtmux-dotfiles
  au!
  exe b:auBufEnter . '/whisperquiet/root-repl.sh let b:tmux_window="bashr"'
  exe b:auBufEnter . '/** call functions#SwitchTmux("dotfiles")'
  autocmd BufEnter whisperquiet/wireguard.sh let b:tmux_window="bashr"
augroup END

augroup reload_tmuxconf " {
  autocmd!
  autocmd BufWritePost tmux.conf :!tmux source-file ~/.tmux.conf\; display-message Reloaded\!
augroup END " }
