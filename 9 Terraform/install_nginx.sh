#!/bin/bash

sudo apt-get update
sudo apt-get install nginx -y
sudo systemctl start nginx 
sudo systemctl enable nginx 

echo "<h1> Terraform in One shot y TWS </h1>" > /var/www/html/index.html
echo "<h1> Terraform in One shot y TWS </h1>" | sudo tee /var/www/html/index.html

