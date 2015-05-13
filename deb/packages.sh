#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing


if [ ! $( id -u ) -eq 0 ]; then
    echo "Please enter root's password."
    exec su -c "${0}" # Call this prog as root
    exit ${?}  # sice we're 'execing' above, we wont reach this exit
               # unless something goes wrong.
fi

aptitude install \
  build-essential \
  dkms \
  linux-headers-$(uname -r) \
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
  ffmpeg \
  ncmpcpp \
  gcc-avr \
  binutils-avr \
  avr-libc \
  python3 \
  valgrind-mpi \
  flex \
  ctags \
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
  libevent-dev \
  liblzma-dev \
  libio-pty-perl \
  libfile-next-perl \
  cmake \


