#!/bin/bash
# Add Docker's official GPG key:
sudo apt-get update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" -y
#install docker
apt-cache policy docker-ce -y
sudo apt install docker-ce -y
#get Docker image
sudo docker pull jenkins/jenkins
#run jenkins container
sudo docker run -d -p 8080:8080 -p 50000:50000 --restart=on-failure jenkins/jenkins