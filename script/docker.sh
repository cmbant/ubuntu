#!/bin/bash

#from https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-using-the-repository

apt-get install  -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   
apt-get update
apt-get install -y docker-ce

#don't require sudo to run
groupadd docker
usermod -aG docker ubuntu

#run at start
systemctl enable docker
