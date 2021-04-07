#!/usr/bin/env bash

if [ -z $1 ] ; then
  mvn clean install
else
  docker run -it --rm --name my-maven-project \
                  -v $(realpath .):/usr/src/mymaven:z \
                  -v ${HOME}/.m2:/root/.m2:z \
                  -w /usr/src/mymaven \
                  --user=$(id -u):$(id -g)   \
                  $1 \
                mvn clean install
fi