PS1='\[\e[1;31m\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$\[\e[0m\] '
export HISTTIMEFORMAT='%F %T '
export HISTCONTROL=ignoreboth
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTIGNORE=ls:ll:cd:fg:exit
shopt -s histappend

export EDITOR="vim"
export LESS="-RF"

export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias lx="ls -XshF"
alias lt="ll -rt"
alias ll="ls -l"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias du1="du --max-depth=1|sort -n"
