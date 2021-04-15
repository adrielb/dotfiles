# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/abergman/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
# End of lines configured by zsh-newuser-install
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source "$HOME/.antigen/antigen.zsh"


# antigen bundle git
antigen bundle pip
antigen bundle python
antigen bundle rsync
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle olivierverdier/zsh-git-prompt
PROMPT='%B%m%~%b$(git_super_status) %# '
GIT_PROMPT_EXECUTABLE="haskell"

antigen apply


source ~/.bash_aliases

alias -s pdf=zathura

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/abergman/apps/local/bin/nomad nomad
