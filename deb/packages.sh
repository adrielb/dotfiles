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

apt-get install \
  linux-headers-4.9.0-3-amd64 \
  git \
  python-pip3 \
  libssl-dev \
  libtool \
  liblzma-dev \
  libtool-bin \
  autoconf \
  automake \
  cmake \
  g++ \
  pkg-config \
  unzip \
  sqlite3 \
  libsqlite3-dev \
  libevent-dev \
  libncurses-dev \
  zlib1g-dev \
  xclip \
  libreadline-dev \
  gfortran \
  libbz2-dev \
  exuberant-ctags \
  libatlas3-base \
  latexmk \
  texlive-latex-recommended \
  texlive-science \
  texlive-fonts-extra \
  texlive-plain-extra \
  texlive-extra-utils \
  texlive-luatex \
  texlive-xetex \
  libboost-dev \
  gettext \
  xorg-dev \
  libffi-dev \


aptitude install \
  ack-grep \
  autoconf \
  automake \
  avr-libc \
  awesome \
  awesome-extra \
  binutils-avr \
  build-essential \
  cmake \
  cmakelibevent-dev \
  cscope \
  ctags \
  dkms \
  encfs \
  ffmpeg \
  flashplugin-nonfree \
  flex \
  gcc \
  gcc-avr \
  gfortran \
  git \
  latexmk \
  libatlas-base-dev \
  libopencv-dev \
  libXpm-dev \
  libblas-dev \
  libcurl3 \
  libcurl4-gnutls-dev \
  libevent-dev \
  libffi-dev \
  libfile-next-perl \
  libgif-dev \
  libgnutls-dev \
  libgpm-dev \
  libgsasl7 \
  libgsasl7-dev \
  libgtk2.0-dev \
  libhdf5-dev \
  libio-pty-perl \
  libjson0-dev \
  liblapack-dev \
  liblua5.2-dev \
  liblzma-dev \
  libbz2-dev \
  libncurses-dev \
  libqt4-core \
  libqt4-dev \
  libssl-dev \
  libstfl-dev \
  libtiff-dev \
  libxml2-dev \
  libxslt1-dev \
  libxt-dev \
  libzmq-dev \
  linux-headers-$(uname -r) \
  lua5.2 \
  meld \
  mercurial \
  ncmpcpp \
  ntp \
  parallel \
  pwgen \
  python-dev \
  python-pip \
  python-qt4 \
  ruby \
  ruby-dev \
  smartmontools \
  source-highlight \
  tree \
  tcl \
  tcl-dev \
  texlive \
  texlive-fonts-extra \
  texlive-latex-extra \
  valgrind-mpi \
  xclip \
  zlib1g-dev \

