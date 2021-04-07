#!/usr/bin/env bash

if [ -z $CENTOS_IMAGE ] ; then
  CENTOS_IMAGE=centos_build:latest
fi

maven_build.sh $CENTOS_IMAGE