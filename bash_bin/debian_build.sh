#!/usr/bin/env bash

SCRIPT_DIR=$(readlink -f $(dirname $0))

source $SCRIPT_DIR/shinc/message.sh

if [ -z $DEBIAN_IMAGE ] ; then
  echo_green "DEBIAN_IMAGE variable not set."
  echo_green "Using [docker-mti.di2e.net/maven:debian-3.6.3]"
  DEBIAN_IMAGE=docker-mti.di2e.net/maven:debian-3.6.3
else
  echo_green "DEBIAN_IMAGE=[$DEBIAN_IMAGE]"
fi

maven_build.sh $DEBIAN_IMAGE