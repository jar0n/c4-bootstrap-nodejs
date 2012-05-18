#!/bin/bash

# Install apt tools and extra repo
apt-get install -y python-software-properties

add-apt-repository -y ppa:richarvey/nodejs

apt-get update

# Now install nodeJS and NPM package manager

apt-get install -y nodejs npm
