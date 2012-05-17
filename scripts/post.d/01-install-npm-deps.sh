#!/bin/bash

if [[ -f scripts/post.d/npm_deps ]]
then
    install=(`cat scripts/post.d/npm_deps`)
    for i in "${install[@]}"
	do
	    sudo npm install ${i} -g
	done 
else
    echo "WARNING NOTHING CONFIGURED INSTALL!!!"
    exit 1
fi
