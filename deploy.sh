#!/bin/bash

echo "deleting old app"
sudo rm -rf /var/www/

echo "creating app folder"
sudo mkdir -p /var/www/py-flask-app 

echo "moving files to app folder"
sudo mv  * /var/www/py-flask-app
sudo mv docker-compose.yml /var/www/py-flask-app

# Navigate to the app directory
cd /var/www/py-flask-app/
sudo mv env .env

sudo apt-get update
echo "installing python and pip"
sudo apt-get install -y python3 python3-pip

sudo apt-get install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -a -G docker $(whoami)

sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


# Install application dependencies from requirements.txt
echo "Install application dependencies from requirements.txt"
sudo pip install -r requirements.txt

# Update and install Nginx if not already installed

# if ! command -v nginx > /dev/null; then
#     echo "Installing Nginx"
#     sudo apt-get update
#     sudo apt-get install -y nginx
# fi

# Configure Nginx to act as a reverse proxy if not already configured  AND pass the elastic IP address instead of public to avoid ip change on restart

# if [ ! -f /etc/nginx/sites-available/myapp ]; then
#     sudo rm -f /etc/nginx/sites-enabled/default
#     sudo bash -c 'cat > /etc/nginx/sites-available/myapp <<EOF
# server {
#     listen 80;
#     server_name bharathraigari.signiance.com;

#     location / {
#         include proxy_params;
#         proxy_pass http://65.1.42.164;                                   
#     }
# }
# EOF'

#     sudo ln -s /etc/nginx/sites-available/myapp /etc/nginx/sites-enabled
#     sudo systemctl restart nginx
# else
#     echo "Nginx reverse proxy configuration already exists."
# fi

# Let's encrypt SSL certificate installation for the domain name

#sudo apt-get update
#sudo apt-get install certbot
#sudo apt-get install python3-certbot-nginx

#sudo nginx -t && nginx -s reload

#sudo certbot --nginx -d bharathraigari.signiance.com -d www.bharathraigari.signiance.com


# Stop any existing Gunicorn process
sudo pkill gunicorn
sudo rm -rf myapp.sock

# # Start Gunicorn with the Flask application

# echo "starting gunicorn"
# sudo gunicorn --workers 3 --bind unix:myapp.sock  app:app --user www-data --group www-data --daemon
# echo "started gunicorn 🚀"

sudo docker-compose up -d --build --scale app=3