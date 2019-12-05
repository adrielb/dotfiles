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
 ack
 alien
 autoconf
 automake
 bison
 build-essential
 bzip2
 cmake
 curl
 expat
 exuberant-ctags
 gettext
 git
 hdparm
 iperf3
 libbz2-dev
 libc-bin
 libcurl4-gnutls-dev
 libevent-dev
 libexpat1-dev
 libffi-dev
 libgdbm-dev
 libgl1-mesa-glx
 liblzma-dev
 libncurses-dev
 libncurses5
 libncurses5-dev
 libpcre3-dev
 libqt5widgets5
 libreadline-dev
 libsqlite3-dev
 libssl-dev
 libtool
 libtool-bin
 luajit
 lzma-dev
 mesa-utils
 nvidia-settings-legacy-340xx
 ocaml
 pkg-config
 sqlite
 tcl
 tk-dev
 unison
 xclip
 zlib
 zlib1g
 zlib1g-dev
