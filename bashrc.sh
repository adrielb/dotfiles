#limit memory usage to 1.3GB
#ulimit -v 1300000

#. /share/apps/intel/Compiler/11.0/084/bin/iccvars.sh intel64
#. /share/apps/intel/Compiler/11.0/084/bin/ifortvars.sh intel64
#. /share/apps/intel/impi/3.2.1.009/bin64/mpivars.sh

source /etc/bash_completion.d/git
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
export HISTTIMEFORMAT='%F %T '
export HISTCONTROL=ignoredups
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTIGNORE=ls:ll:cd:fg:exit
shopt -s histappend
set -o vi  # enable vi editing mode
bind -m vi-insert "\C-l":clear-screen # ^l clear screen


export ALT_DISP=/home/abergman/Research/ImageAnalysis/AlternativeDisplay.m
export EDITOR="vim"
export PATH=/home/abergman/Research/configurations:$PATH
export PATH=/usr/lib64/openmpi/bin:$PATH
export LD_LIBRARY_PATH=/usr/lib64/openmpi/lib:$LD_LIBRARY_PATH
export PATH=/share/apps/bin:$PATH
export PATH=/usr/local/texlive/2012/bin/x86_64-linux:$PATH

export DCELL_DIR=/home/abergman/Research/DCell
export PETSC_TMP=/data/scratch
export PETSC_DIR=/share/apps/petsc-3.2-p5
export PETSC_ARCH=gcc-debug
export LD_LIBRARY_PATH=${DCELL_DIR}/lib:$LD_LIBRARY_PATH

export ACK_OPTIONS="-A 5 --nohtml"
export ACK_PAGER_COLOR="less -R"
export LESS="-RF"
export LESSOPEN="|src-hilite-lesspipe.sh %s"

#module load openmpi-i386
#export PATH=/usr/java/latest/bin:/home/abergman/bin:/share/apps/bin:$PATH
#export XLIB_SKIP_ARGB_VISUALS=1 #Removes alpha blending so Mathematica works
#export PATH=/usr/local/texlive/2008/bin/x86_64-linux:$PATH
#export LD_LIBRARY_PATH=/usr/local/lib/:$LD_LIBRARY_PATH
#export PATH=/share/apps/cmake-2.6.4-Linux-i386/bin:$PATH
#export CMAKE_ROOT=/share/apps/cmake-2.6.4-Linux-i386
#export ITK_DIR=/share/apps/InsightToolkit-3.16.0
#export PATH=/share/apps/InsightToolkit-3.16.0/bin:$PATH
#export PYTHONPATH=/share/apps/InsightToolkit-3.16.0/Wrapping/CSwig/Python:/share/apps/InsightToolkit-3.16.0/bin:$PYTHONPATH

alias tmux="export TERM=screen-256color; tmux"
alias lx="ls -XshF"
alias lt="ll -rt"
alias du1="du --max-depth=1|sort -n"
alias xclip="xclip -selection clipboard"
alias gst="git st"
alias v="vim"
alias vimc='cd /home/abergman/projects/codebank/; vim +CtrlP'
alias vimt='tmux new vim \; split-window'
alias vimless='vim -c "set nomodifiable" '

function vimdot() {
  SESSION="dotfiles"
  cd ~/projects/dotfiles/
  if tmux has-session -t $SESSION; then
    tmux attach -t $SESSION
  else
    tmux new-session -s $SESSION \; \
         send-keys 'vim +CtrlP' C-m \; \
         split-window -v -p 30 \; \
         select-pane -t 0
  fi
}

function vimbarr() {
  SESSION="barrestin"
  cd ~/projects/barrestin/python/
  if tmux has-session -t $SESSION; then
    tmux attach -t $SESSION
  else
  tmux new-session -s barrestin 'vim equ.py' \; \
       split-window -v -p 30 ipython \; \
       select-pane -t 0
  fi
}

function cl () {
  if [ $# = 0 ]; then
    cd && ll
  else
    cd "$*" && ll
  fi
}

NORMAL=$( tput sgr0 )
RED=$( tput setaf 1 )
GREEN=$(tput setaf 2; tput bold)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)

function red() {
  echo -e "$RED$*$NORMAL"
}

function green() {
  echo -e "$GREEN$*$NORMAL"
}

function yellow() {
  echo -e "$YELLOW$*$NORMAL"
}


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
