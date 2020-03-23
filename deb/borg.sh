#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing


cd ~/apps/local/bin

wget https://github.com/borgbackup/borg/releases/download/1.1.11/borg-linux64

wget https://github.com/borgbackup/borg/releases/download/1.1.11/borg-linux64.asc

gpg --recv-keys 9F88FB52FAF7B393
gpg --verify borg-linux64.asc borg-linux64

mv borg-linux64 borg

chmod u+x borg

rm borg-linux64.asc
