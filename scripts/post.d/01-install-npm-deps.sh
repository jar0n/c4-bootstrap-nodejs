#!/bin/bash

# Firstly set up the node user

useradd --home-dir /home/node -s /bin/bash
chown -Rf node.node /home/node

# now install npm modules

if [[ -f scripts/post.d/npm_deps ]]
then
    install=(`cat scripts/post.d/npm_deps`)
    for i in "${install[@]}"
	do
	    su node -c "npm install express"
	done 
else
    echo "WARNING NOTHING CONFIGURED INSTALL!!!"
    exit 1
fi
