#!/bin/bash

#get GPG key
# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
#create a sources list file
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
# echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
#reload package database
sudo apt-get update
#install Mongo
sudo apt-get install -y mongodb-org --allow-unauthenticated
#copy custom mongo config
sudo mv mongod.conf /etc/mongod.conf
#start mongo
sudo systemctl enable mongod.service
sudo systemctl start mongod
