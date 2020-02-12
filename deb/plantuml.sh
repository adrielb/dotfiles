#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing


URL=http://sourceforge.net/projects/plantuml/files/plantuml.jar/download

cd /tmp
wget --no-clobber $URL

mv download ~/apps/local/lib/plantuml.jar
