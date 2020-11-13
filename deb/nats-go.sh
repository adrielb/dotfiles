#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

export GO111MODULE=on

go get github.com/nats-io/nats.go/@latest

go get github.com/nats-io/nats.go/examples/nats-sub

