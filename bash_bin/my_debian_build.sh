#!/usr/bin/env bash
echo docker run -it --rm --name my-maven-project \
                  -v $(wslpath -w $(realpath .)):/usr/src/mymaven:z \
                  -v $(wslpath -w ${HOME}/.m2):/root/.m2:z \
                  -w /usr/src/mymaven \
                  --user=$(id -u):$(id -g)   \
                  docker-mtt.di2e.net/maven:debian-3.6.3 \
                mvn clean install
