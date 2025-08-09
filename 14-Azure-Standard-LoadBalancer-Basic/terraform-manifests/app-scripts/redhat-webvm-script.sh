#!/bin/bash

# Update package list and install Apache (httpd equivalent)
sudo apt update -y
sudo apt install -y apache2 curl

# Enable and start Apache service
sudo systemctl enable apache2
sudo systemctl start apache2

# Set permissions on the web root
sudo chmod -R 777 /var/www/html

# Create initial HTML file
echo "Welcome to stacksimplify - WebVM App1 - VM Hostname: $(hostname)" | sudo tee /var/www/html/index.html

# Create app1 directory and additional HTML files
sudo mkdir -p /var/www/html/app1
echo "Welcome to stacksimplify - WebVM App1 - VM Hostname: $(hostname)" | sudo tee /var/www/html/app1/hostname.html
echo "Welcome to stacksimplify - WebVM App1 - App Status Page" | sudo tee /var/www/html/app1/status.html

# Create styled index page
cat <<EOF | sudo tee /var/www/html/app1/index.html
<!DOCTYPE html>
<html>
  <body style="background-color:rgb(250, 210, 210);">
    <h1>Welcome to Stack Simplify - WebVM APP-1 </h1>
    <p>Terraform Demo</p>
    <p>Application Version: V1</p>
  </body>
</html>
EOF

# Fetch Azure Instance Metadata and write to metadata.html
curl -H "Metadata:true" --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2020-09-01" | sudo tee /var/www/html/app1/metadata.html