#!/usr/bin/bash

sudo systemctl daemon-reload

systemctl restart gunicorn.service
sudo rm -f /etc/nginx/sites-available/default

sudo cp /home/ubuntu/blogprojectdrf/nginx/nginx.conf /etc/nginx/sites-available/blog
sudo ln -s /etc/nginx/sites-available/blog /etc/nginx/sites-enabled
sudo gpasswd -a www-data ubuntu
sudo systemctl reload nginx
sudo systemctl restart nginx
sudo nginx -t
sudo systemctl restart nginx
sudo ufw delete allow 8000
sudo ufw allow 'Nginx Full'