#!/bin/bash
clear
ROOT=`pwd`
REPOS=`find $ROOT/ -name .git`
for repo in $REPOS
do
    repo=$(dirname $repo)
    echo $repo
    cd $repo 
    git status --short
done
