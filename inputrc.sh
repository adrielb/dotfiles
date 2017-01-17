# set show-mode-in-prompt on
set completion-ignore-case on
set completion-prefix-display-length 2
set show-all-if-ambiguous on
set colored-stats on
"\e[A": history-search-backward
"\e[B": history-search-forward
"\C-x*": glob-expand-word
"\C-]":"\C-e\C-u xclip <<"EOF"\n\C-y\nEOF\n"
Control-k: history-search-backward
