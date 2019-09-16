let b:auBufEnter='autocmd BufEnter ' . expand('<sfile>:p:h')
augroup switchtmux-dotfiles
  au!
  " exe b:auBufEnter . '/app.py let b:tmux_window="web"'
  exe b:auBufEnter . '/** call functions#SwitchTmux("dotfiles")'
augroup END

augroup reload_tmuxconf " {
  autocmd!
  autocmd BufWritePost tmux.conf :!tmux source-file ~/.tmux.conf\; display-message Reloaded\!
augroup END " }
