#!/usr/bin/env bash

if [ -z $DEBIAN_IMAGE ] ; then
  DEBIAN_IMAGE=debian_build:9.9
fi

docker run -it --rm --name my-maven-project \
                 -v $(realpath .):/usr/src/mymaven:z \
                 -v ${HOME}/.m2:/root/.m2:z \
                 -w /usr/src/mymaven \
                 --user=$(id -u):$(id -g)   \
                 $DEBIAN_IMAGE \
               mvn clean install
