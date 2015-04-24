
#source /etc/bash_completion.d/git
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

PS1='\[\e[1;37m\]\u@\h:\w\$\[\e[0m\] '

# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT='%F %T '
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTIGNORE=ls:ll:cd:fg:exit:ZZ
# append to the history file, don't overwrite it
shopt -s histappend
set -o vi  # enable vi editing mode
bind -m vi-insert "\C-l":clear-screen # ^l clear screen

export EDITOR="nvim"
export PATH=~/.cabal/bin:$PATH
export PATH=~/apps/local/bin:$PATH
export PATH=~/projects/dotfiles/bin:$PATH
export PATH=~/apps/llvm/llvm-3.4/build/bin:$PATH

export PYTHONPATH=~/VTK-OS/lib:~/VTK-OS/Wrapping/Python

export PETSC_DIR=~/apps/petsc
export PETSC_TMP=~/tmp

export ACK_OPTIONS="-A 5"
export ACK_PAGER_COLOR="less -R"
export LESS="-R"
export LESSOPEN="|/usr/share/source-highlight/src-hilite-lesspipe.sh %s"

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

if [ "$COLORTERM" == "gnome-terminal" ]; then
  TERM=xterm-256color
fi

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
		LESS_TERMCAP_so=$(printf "\e[1;42;30m") \
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
    *.tar.bz2) tar xvf "$1"   ;;
    *.tgz)     tar xvf "$1"   ;;
    *.tar.gz)  tar xvf "$1"   ;;
    *.zip)     unzip   "$1"   ;;
    *.rar)     unrar x "$1"   ;;
    *.pdf)     evince  "$1" & ;;
    *)         vim     "$1"   ;;
  esac
}

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

function cl()
{
    cd "$@" && ll
}

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

GIT_PROMPT_ONLY_IN_REPO=1
source ~/.bash-git-prompt/gitprompt.sh

# fzf - Fuzzy finder for your shell
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

fp() {
  local file
  cd ~/projects
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-nvim} "$file"
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fkill - kill process
fkill() {
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}

ftime() {
  find -iname "$1" -type f -printf '%T@ \033[32m%Ca %Cb %Cd %CY %Cr \033[0m %p\n'|sort -n|sed 's/^[^ ]* //'
}
