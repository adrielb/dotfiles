let b:auBufEnter='autocmd BufEnter ' . expand('<sfile>:p:h')
augroup switchtmux-dotfiles
  au!
  exe b:auBufEnter . '/** call functions#SwitchTmux("dotfiles")'
augroup END
