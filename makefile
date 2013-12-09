DOT=`pwd`

links:
	ln -sf ${DOT}/vimperatorrc ~/.vimperatorrc
	ln -sf ${DOT}/ghci.conf ~/.ghc/ghci.conf
	ln -sf ${DOT}/vimrc ~/.vimrc
	ln -sf ${DOT}/tmux.conf ~/.tmux.conf
	ln -sf ${DOT}/toprc ~/.toprc

slime:
	chmod 700 dotfiles
	chmod 600 ghci.conf
