#!/bin/bash

while true
do
  $@
  echo -n "sleeping..."
  sleep 1
  echo "awoken"
done
