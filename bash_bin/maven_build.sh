#!/usr/bin/env bash
#
# Usage: maven_build/sh <build_image_name>
# 
# If no build image name is provided, then the script will attempt to use the locally installed
# maven to build
#

SCRIPT_DIR=$(readlink -f $(dirname $0))

source $SCRIPT_DIR/shinc/message.sh

if [ -z $1 ] ; then
  echo_red "No Docker build image given. Attempting maven locally"
  echo_green "Running [mvn clean install]"
  echo_green "---------------------------"  
  mvn clean install
else
  echo_green "Using Docker image [$1] to run [mvn clean install]"
  docker run -it --rm --name my-maven-project \
                  -v $(realpath .):/usr/src/mymaven:z \
                  -v ${HOME}/.m2:/root/.m2:z \
                  -w /usr/src/mymaven \
                  --user=$(id -u):$(id -g)   \
                  $1 \
                mvn clean install
fi
