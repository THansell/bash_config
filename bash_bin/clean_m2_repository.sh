#!/usr/bin/env bash

while (( "$#" )); do
  case $1 in
    -y)
      just_do_it="YES"
      shift
      ;;
    *) # Preserve any posiional arguments
      PARAMS="$PARAMS $1"
      shift
      ;;
  esac
done

function yes_or_no {
  local yn="Bogus"
  echo $just_do_it
  if [ -z $just_do_it ]; then
    while true; do
      read -p "$* [y/n]:" yn
      case $yn in
        [Yy]*) return 0 ;;
        *) return 1 ;;
      esac
    done
  else
    return 0
  fi
}

yes_or_no "Are you sure you want to do this?" && rm -rfv ~/.m2/repository/* && exit 0

echo "Process aborted"

