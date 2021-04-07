#!/usr/bin/env bash

if [ -z $DEBIAN_IMAGE ] ; then
  DEBIAN_IMAGE=debian_build:latest
fi

maven_build.sh $DEBIAN_IMAGE