#c4-bootstrap-nodejs

## Summary

This project provides a simple way to deploy a nodeJS environment and save your code with version control. It uses the c4-bootstrap lightweight system management tools.

## System Requirements

You will need to install:

    git-core

To do so, run:

    apt-get update
    apt-get install git-core

These standard toolkits should also be present on the system:

    bash
    tar
    gzip

## How To: Bootstrap

Bootstrapping your server will install the requested environment on your system.

Fire up your Ubuntu server or Ubuntu AMI EC2 instance. These scripts are designed to work on Ubuntu 12.04 LTS. Please see c4-bootstrap documentation for further information on compatibility and the deployment framework in general.

To get started, fork this git repo and clone it onto the fresh server:

    First click the fork button on the this github page
    // You'll need a github account to do this
    // We recommend you have a paid account to keep your code private.
    
Optional: You can rename your fork to represent the project you are working on. If you do you will have to change the lines below to reflect your new repo name.

On the server CLI:

    git clone https://github.com/*<USERNAME>*/c4-bootstrap-nodejs.git
    cd c4-bootstrap-nodejs
    sudo ./bootstrap.sh

There should be considerable output on screen. Once the script has finished, the system should be fully up and running.

### nodeJS specific notes

#### Working directories + upstart scripts

nodeJS apps are designed to run from **/home/node** as the user ***node***. Keeping all files in this directory means the repack script can back them up easily. In **/etc/init** there is a skeleton upstart script provided called **node-skeleton.conf** .This allows you to easily start and stop your application.

#### nodeJS version

Because Ubuntu 12.04 has an outdated branch of nodeJS we use a custom repository (PPA) maintained by [@ric_harvey](https://twitter.com/#!/ric_harvey) that can be found at [launchpad.net](https://launchpad.net/~richarvey/+archive/nodejs) which is currently tracking the 0.6.x branch.

#### NPM modules

If you need extra node packages installed on the server just at the names in a line separated file called **npm_deps** that can be located in **scripts/post.d/**
 
## How To: Repack (repack.sh)

While developing your site the contents of the site may change frequently. repack.sh is designed to help track these changes in github. This will allow a rebuild of the server to a given point in time. It is good practice to use repack.sh regularly to avoid loss of work, especially if you frequently add content to your site.

Simply run these commands (remember to reflect the repository name if changed from default):

    cd c4-bootstrap-nodejs
    sudo ./repack.sh

This will create a SiteContent.tgz of your site and push it back to your github repo. It can be used to back up the site or re-deploy it to a new server using the bootstrap.sh script. 

c4-bootstrap-nodejs is set up to monitor the following directories:

    /home/node

Changes in these directories will be pulled back into your git repo when running repack. To add more locations just edit the __scripts/repack/working_dirs__ file.

NB : A private github repo should be used to avoid exposing your code and configs to everyone!

## More info

For more info on the c4-bootstrap project; please refer to:

[https://github.com/channel4/c4-bootstrap/blob/master/README.md](https://github.com/channel4/c4-bootstrap/blob/master/README.md "c4-bootstrap README")
