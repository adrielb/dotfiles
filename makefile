DOT=`pwd`

links:
	-ln -sf ${DOT}/vimperatorrc ~/.vimperatorrc
	-mkdir -p ~/.ghc
	-ln -sf ${DOT}/ghci.conf ~/.ghc/ghci.conf
	-ln -sf ${DOT}/tmux.conf ~/.tmux.conf
	-ln -sf ${DOT}/toprc ~/.toprc
	-ln -sf ${DOT}/gitconfig ~/.gitconfig
	-ln -sf ${DOT}/xmodmap ~/.xmodmap
	-ln -sf ${DOT}/xsession ~/.xsession
	-chmod 700 ~/.xsession
	-ln -sf ${DOT}/awesome ~/.config/awesome
	-ln -sf ${DOT}/home.gitignore ~/.gitignore
	-ln -sf ${DOT}/inputrc.sh ~/.inputrc
	-ln -sf ${DOT}/bash_aliases.sh ~/.bash_aliases
	-ln -sf ${DOT}/Rprofile ~/.Rprofile
	-ln -sf ${DOT}/ackrc ~/.ackrc
	-ln -sf ${DOT}/bash_profile.sh ~/.bash_profile

slime:
	chmod 700 dotfiles
	chmod 600 ghci.conf

root:
	su -c ' \
	cp -f ${DOT}/root.vimrc /root/.vimrc; \
	cp -f ${DOT}/bashrc.root.sh /root/.bashrc.root.sh; \
	cp -f ${DOT}/gitconfig /root/.gitconfig; \
	'

REPOS=${addprefix ~/projects/,  \
dcard learnzeromq dotvim learnhaskell learnd3 workout DCell ergodox-firmware \
ChemoMech BetaArrestin optimization adrielb.github.io hakyll-blog}

${REPOS}:
	git clone git@github.com:adrielb/${@F}.git $@

github: ${REPOS}
