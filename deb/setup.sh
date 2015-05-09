#!/bin/bash
set -e # exit immediately upon failure
set -o pipefail # exit status 0 only if all cmds 0
set -x # log all cmds before executing

APPS=~/apps/

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


