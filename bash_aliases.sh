alias ..="cd .."
alias lx="ls -XshF"
alias lt="ll -rt"
alias ll="ls -l"
alias du1="du --max-depth=1|sort -n"
alias xclip="xclip -selection clipboard"
alias ZZ="exit"
alias cmdcp="history 2|head -n 1|xclip"

alias cpavr='cp -avr'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias fhere="find . -iname "
alias myip="curl http://ipecho.net/plain; echo"
