alias ..="cd .."
alias lx="ls -XshF"
alias lt="ll -rt"
alias ll="ls -l"
alias ldir="ll -d */"
alias du1="du --max-depth=1|sort -n"
alias xclip="xclip -selection clipboard"
alias ZZ="exit"
alias cmdcp="history 2|head -n 1|xclip"
alias grep='grep --color=auto'
alias mkdir='mkdir -pv'
alias wget='wget -c'

alias mysync="rsync --verbose --stats --progress --archive --checksum \
      --compress --human-readable "
alias cpavr='cp -avr'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias fhere="find . -iname "
alias myip="curl http://ipecho.net/plain; echo"
alias mylocalip="ip addr show label eth0|grep 'inet '|cut '-d ' -f6"
alias gitpushstatusall='gitstatusall.sh |grep -B 2 "Your branch is ahead"'
alias cdg='cd $(git rev-parse --show-toplevel)'
alias gti='git'
alias R="R -q"
alias rmux='tmux new "R -q"'
alias pmux='tmux new "ipython --no-banner"'
alias gmux='tmux new "ghci"'
alias lvim='nvim -c "normal '\''0"'
alias bc='bc -l'
alias v='zathura --fork'
