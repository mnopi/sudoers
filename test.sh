#!/bin/sh
#sudo='ls'
flag='-la'
case "$1" in
  -S) echo "${PASSWORD}" | ls "$@" ;;
  *) ls ${flag-} "$@" ;;
esac
