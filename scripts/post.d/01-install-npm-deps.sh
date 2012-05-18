#!/bin/bash

# Firstly set up the node user

useradd --home-dir /home/node -s /bin/bash node
chown -Rf node.node /home/node

# now install npm modules

if [[ -f scripts/post.d/npm_deps ]]
then
    install=(`cat scripts/post.d/npm_deps`)
    cd /home/node
    for i in "${install[@]}"
	do
	    sudo -u node npm install ${i}
	done 
else
    echo "WARNING NOTHING CONFIGURED INSTALL!!!"
    exit 1
fi
