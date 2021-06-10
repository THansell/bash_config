#!/usr/bin/env bash

SCRIPT_DIR=$(readlink -f $(dirname $0))

if [ ! -z $MTI_REPO_DIR ]; then
  cd $MTI_REPO_DIR
fi

source $SCRIPT_DIR/shinc/message.sh
source $SCRIPT_DIR/shinc/mti-repositories.sh


for repo in ${MTI_REPOSITORIES[@]}; do
  echo "---- [$repo] ----"
  ( cd $repo \
      && git checkout develop )
  echo "---- [$repo] done"
done