#!/bin/bash
clear
ROOT=`pwd`
REPOS=`find $ROOT/ -name .git`
for repo in $REPOS
do
    repo=$(dirname $repo)
    echo -e '\e[1;37m'$repo '\e[0m'
    cd $repo 
    git status -sb
done
