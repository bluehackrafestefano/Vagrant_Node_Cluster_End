#!/bin/bash

# Get GPG key
curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -

# Create a sources list file
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

# Reload package database
sudo apt-get update

# Install mongo
sudo apt-get install mongodb-org -y
# sudo apt-get install -y mongodb-org --allow-unauthenticated

# Copy custom mongo config
sudo mv mongod.conf /etc/mongod.conf

# Enable mongo to start after reboot
sudo systemctl enable mongod

# Start mongo
sudo systemctl start mongod
