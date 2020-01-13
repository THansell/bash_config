#!/bin/bash
#

# fetch and prune the repository
# Change to develop
# and pull any changes
git fetch --prune
git checkout develop
git pull

# Loop over dead local branches
for branch in $(git branch --verbose | grep ': gone' | awk '{print $1}')
do
    echo "Removing dead local branch [$branch]"
    git branch -D $branch
done