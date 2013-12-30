
source /etc/bash_completion.d/git
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
export HISTTIMEFORMAT='%F %T '
export HISTCONTROL=ignoreboth
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTIGNORE=ls:ll:cd:fg:exit
shopt -s histappend
set -o vi  # enable vi editing mode
bind -m vi-insert "\C-l":clear-screen # ^l clear screen


export EDITOR="vim"
export PATH=~/projects/dotfiles/bin:$PATH


export ACK_OPTIONS="-A 5"
export ACK_PAGER_COLOR="less -R"
export LESS="-RF"
export LESSOPEN="|src-hilite-lesspipe.sh %s"

alias lx="ls -XshF"
alias lt="ll -rt"
alias ll="ls -l"
alias du1="du --max-depth=1|sort -n"
alias xclip="xclip -selection clipboard"


debug() { [ "$DEBUG" ] && echo ">>> $*"; }

_path_add() {
  # Adds a directory to $PATH, but only if it isn't already present.
  # http://superuser.com/questions/39751/add-directory-to-path-if-its-not-already-there/39995#39995
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="$1:${PATH:+"$PATH:"}"
  fi
}

man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}


function o()
{
  if [ ! -f $1 ]; then
    echo "'$1' dose not exist or is not a regular file"
    return 1
  fi

  case $1 in 
    *.tar.bz2) tar xvf $1 ;;
    *.tar.gz)  tar xvf $1 ;;
    *.zip)     unzip   $1 ;;
    *.rar)     unrar x $1 ;;
    *.pdf)     evince  $1 ;;
    *)         vim     $1 ;;
  esac
}

