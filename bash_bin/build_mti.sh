#!/usr/bin/env bash

SCRIPT_DIR=$(readlink -f $(dirname $0))

if [ ! -z $MTI_REPO_DIR ]; then
  cd $MTI_REPO_DIR
fi

source $SCRIPT_DIR/shinc/mti-repositories.sh
source $SCRIPT_DIR/shinc/message.sh

build_system="debian"

while (( "$#" )); do
  case $1 in
    --centos)
      build_system="centos"
      shift
      ;;
    --debian)
      build_system="debian"
      shift
      ;;
    --clean_m2)
      echo_red "Cleaning M2 Repository"
      clean_m2_repository.sh -y
      shift
      ;;
    *) # Preserve any posiional arguments
      PARAMS="$PARAMS $1"
      shift;
      ;;
  esac
done

for repo in ${MTI_REPOSITORIES[@]}; do
  ( cd $repo \
      && echo_green "--- $repo ---" \
      && ${build_system}_build.sh \
      && echo_green "--- $repo done"
  )
done