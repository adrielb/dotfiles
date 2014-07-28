#!/bin/bash
set -e # exit immediately upon failure
set -x # log all cmds before executing
set -o pipefail # exit status 0 only if all cmds 0

APPS=~/apps/

packages() #{{{
{
  su -c 'aptitude install \
    libcurl3 \
    gcc \
    git \
    meld \
    awesome \
    awesome-extra \
    libblas-dev \
    liblapack-dev \
    gfortran \
    mercurial \
    libncurses-dev \
    cscope \
    libgtk2.0-dev \
    libxt-dev \
    ruby-dev \
    tcl-dev \
    ruby \
    tcl \
    liblua5.2-dev \
    lua5.2 \
    libqt4-core \
    libqt4-dev \
    libzmq-dev \
    libhdf5-dev \
    python-dev \
    python-pip \
    python-qt4 \
    ack-grep \
    pwgen \
    smartmontools \
    xclip \
    texlive \
    texlive-latex-extra \
    texlive-fonts-extra \
    latexmk \
    source-highlight \
    encfs \
    flashplugin-nonfree \
    iceweasel-flashblock \
    ffmpeg \
    mpd \
    ncmpcpp \
    gcc-avr \
    binutils-avr \
    avr-libc \
    python3 \
    valgrind-mpi \
    flex \
    ctags \
    lighttpd \
    cmakelibevent-dev \
    libgnutls-dev \
    libgsasl7 \
    libgsasl7-dev \
    ntp \
    sqlite3 \
    libsqlite3-dev \
    libcurl4-gnutls-dev \
    libstfl-dev \
    libjson0-dev \
    autoconf \
    automake \
  '

}
#}}}

# vim {{{
VIMDIR=$APPS/vim

vim()
{
  if [ ! -d "$VIMDIR" ]; then
    hg clone https://vim.googlecode.com/hg/ ${VIMDIR}
  fi

  cd ${VIMDIR}
  hg pull -u 
  hg update --clean
  ./configure \
    --with-features=huge \
    --enable-cscope \
    --enable-pythoninterp \
    --enable-tclinterp \
    --enable-luainterp \
    --enable-rubyinterp \
    --enable-gui=gtk2 \
    --enable-fail-if-missing 
  make clean
  make -j16 
  su -c 'make install'
  # since function name is same as program name, delete function
  unset -f vim
  vim --version
}
#}}}

# solarized {{{
solarized()
{
    cd /tmp
    git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git
    cd gnome-terminal-colors-solarized
    ./install.sh
}
# }}}

CMD=$1
LOGDIR=logs
LOGFILE=$LOGDIR/$CMD-`date '+%F-%T'`
mkdir -p $LOGDIR

if (( $# == 0 )); then
  packages
else
  $CMD \
     > >(tee $LOGFILE.stdout) \
    2> >(tee $LOGFILE.stderr >&2)
fi


