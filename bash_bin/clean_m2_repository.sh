#!/usr/bin/env bash

function yes_or_no {
  local yn="Bogus"
  while true; do
    read -p "$* [y/n]:" yn
    case $yn in
      [Yy]*) return 0 ;;
      *) return 1 ;;
    esac
  done
}

yes_or_no "Are you sure you want to do this?" && rm -rfv ~/.m2/repository/* && exit 0

echo "Process aborted"

