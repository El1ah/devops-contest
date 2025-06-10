#!/bin/bash
sudo yum install nginx
echo "Hello World" | sudo tee /usr/share/nginx/html/index.html
sudo systemctl enable nginx
sudo systemctl start nginx