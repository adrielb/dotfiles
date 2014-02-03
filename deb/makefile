all: packages

packages:
	su -c 'aptitude install \
		libcurl3 gcc git meld \
		awesome awesome-extra \
		libblas-dev liblapack-dev gfortran \
		mercurial libncurses-dev cscope \
		libgtk2.0-dev libxt-dev \
		ruby-dev tcl-dev ruby tcl \
		liblua5.2-dev lua5.2 \
		libqt4-core libqt4-dev \
		libzmq-dev libhdf5-dev \
		python-dev python-pip python-qt4 \
		ack-grep pwgen smartmontools xclip \
		texlive texlive-latex-extra latexmk \
		source-highlight tmux encfs \
		flashplugin-nonfree iceweasel-flashblock \
		ffmpeg \
		gcc-avr binutils-avr avr-libc \
	'
	
nvidia:
	aptitude -r install linux-headers-amd64 nvidia-kernel-dkms nvidia-xconfig

python:
	-easy_install -U distribute
	pip install jedi
	pip install pyzmq
	pip install numpy
	pip install matplotlib
	pip install scipy
	pip install scikit-learn
	pip install pylint pandas ipython
	pip install sympy
	pip install numexpr
	pip install cython
	pip install tables
	pip install h5py
	pip install pyyaml nltk
	pip install patsy
	pip install statsmodels
	pip install moviepy

VIMDIR=/tmp/vim
${VIMDIR}:
	hg clone https://vim.googlecode.com/hg/ ${VIMDIR}

vim: ${VIMDIR}
	cd ${VIMDIR} && \
	hg pull -u && \
	hg update --clean && \
	./configure \
		--with-features=huge \
		--enable-cscope \
		--enable-pythoninterp \
		--enable-tclinterp \
		--enable-luainterp \
		--enable-rubyinterp \
		--enable-gui=gtk2 \
		--enable-fail-if-missing && \
	make clean && \
	make -j16 && \
	make install && \
	vim --version

solarized:
	cd /tmp/ && \
	git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git && \
	cd gnome-terminal-colors-solarized && \
	./install.sh

ctrl:
	echo 'XKBOPTIONS="ctrl:nocaps"' >> /etc/default/keyboard

ETCAPC=/etc/apcupsd/apcupsd.conf
apcupsd:
	su -c '                             \
	set -x;                             \
	if [ ! -e ${ETCAPC}.orig ];         \
	then                                \
	  cp ${ETCAPC} ${ETCAPC}.orig;      \
	fi;                                 \
	cp -f `pwd`/apcupsd.conf ${ETCAPC}; \
	sed -i "s/\(ISCONFIGURED=\).*/\1yes/" /etc/default/apcupsd; \
	service apcupsd start;       \
	sleep 1;                     \
	tail /var/log/apcupsd.events; \
	apcaccess status \
	'
