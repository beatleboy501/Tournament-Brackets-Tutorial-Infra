#!/bin/bash

for i in $( ls -1 -p | grep /);
do
    cd $i
    if [ -d ".git" ]
    then
        echo ...
        echo "$(pwd):"
        path=$(git remote -v | grep -o -m 1 "v1/repos/\S*")
        echo "deleting old git credentials for $path"
        security delete-internet-password -p $path > /dev/null
        echo "updating git repo, creating new credentials"
        echo "git status:"
        eval "git pull"
    fi
    cd ..
done
