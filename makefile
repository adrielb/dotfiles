DOT=`pwd`


links:
	ln -sf ${DOT}/vimperatorrc ~/.vimperatorrc
	ln -sf ${DOT}/ghci.conf ~/.ghc/ghci.conf

slime:
	chmod 700 dotfiles
	chmod 600 ghci.conf
