#!/bin/bash
# https://coderwall.com/p/ewz5zq

function unstaged_changes() {
    worktree=${1%/*};
    git --git-dir="$1" --work-tree="$worktree" diff-files --quiet --ignore-submodules --
}

function uncommited_changes() {
    worktree=${1%/*};
    git --git-dir="$1" --work-tree="$worktree" diff-index --cached --quiet HEAD --ignore-submodules --
}

function find-dirty () {
    for gitdir in `find . -name .git`;
    do
        worktree=${gitdir%/*};
        if ! unstaged_changes $gitdir
        then
            echo "unstaged     $gitdir"
        fi

        if ! uncommited_changes $gitdir
        then
            echo "uncommitted  $gitdir"
        fi
    done
}

find-dirty
