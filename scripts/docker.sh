#!/bin/bash
echo
echo "Setup Docker https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-using-the-repository"
echo

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce

#add user
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker
