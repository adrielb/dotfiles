
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

export LD_LIBRARY_PATH=~/apps/local/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=~/apps/R-cran/R-3.3.1/lib:$LD_LIBRARY_PATH
export PATH=~/projects/dotfiles/bin:$PATH
export    PATH=~/apps/local/bin:$PATH
export MANPATH=~/apps/local/share/man:$MANPATH

export EDITOR="nvim"
export ACK_OPTIONS="-A 5"
export ACK_PAGER_COLOR="less -R"
export LESS="-RFX"
export LESSOPEN="|/usr/share/source-highlight/src-hilite-lesspipe.sh %s"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

debug() { [ "$DEBUG" ] && echo ">>> $*"; }

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


if [ -z $(readlink /proc/$PPID/exe | grep -q gnome-terminal) ]; then
  TERM=xterm-256color
fi

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

if [ -f ~/projects/dotfiles/scripts/tmux.completion.bash ]; then
. ~/projects/dotfiles/scripts/tmux.completion.bash
fi

source ~/apps/git/contrib/completion/git-completion.bash

GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_THEME=Custom
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
  file=$(ag -l --ignore docindexer/static | fzf --query="$1" --select-1 --exit-0)
  if [ -n "$file" ]
  then
    cd `dirname $file`
    cdg
    ${EDITOR:-nvim} ~/projects/"$file"
  fi
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-~/projects/*} -path '*/\.*' -prune \
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
