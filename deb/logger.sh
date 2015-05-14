#!/bin/bash
set -e # exit immediately upon failure
set -o pipefail # exit status 0 only if all cmds 0
set -x # log all cmds before executing

APPS=~/apps/


LOGDIR=logs
LOGFILE=$0-`date '+%F-%T'`
LOG=$LOGDIR/$LOGFILE
mkdir -p $LOGDIR
ln -sf $LOGFILE.stdout $LOGDIR/$0.stdout
ln -sf $LOGFILE.stderr $LOGDIR/$0.stderr

startLog() {
  exec > >(tee -a $LOG.stdout) \
      2> >(tee -a $LOG.stderr >&2)
}

stopLog() {
  exec > /dev/tty \
      2>&1
}

startLog

