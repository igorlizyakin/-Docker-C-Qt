#!/bin/bash
set -x
sudo apt-get update -y
sudo apt-get install -y ansible git
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub
git config --global user.name "igorlizyakin"
git config --global user.email "igor.lizyakin@gmail.com"
echo 'git clone git@gitlab.com:igorlizyakin/devops_install_docker.git'
