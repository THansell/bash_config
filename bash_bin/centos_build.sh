#!/usr/bin/env bash

SCRIPT_DIR=$(readlink -f $(dirname $0))

source $SCRIPT_DIR/shinc/message.sh

if [ -z $CENTOS_IMAGE ] ; then
  echo_green "CENTOS_IMAGE variable not set."
  echo_green "Using [docker-mti.di2e.net/maven:debian-3.6.3]"
  CENTOS_IMAGE=docker-mti.di2e.net/maven:debian-3.6.3
else
  echo_green "CENTOS_IMAGE=[$CENTOS_IMAGE]"
fi

maven_build.sh $CENTOS_IMAGE