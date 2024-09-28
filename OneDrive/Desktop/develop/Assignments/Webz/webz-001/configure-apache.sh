#!/bin/bash

# Task 1: Add 'ServerName 172.18.0.5' to /etc/apache2/apache2.conf
# Check if the line already exists, if not, append it
grep -q "ServerName 172.18.0.5" /etc/apache2/apache2.conf || echo "ServerName 172.18.0.5" | sudo tee -a /etc/apache2/apache2.conf

container_name=$(docker inspect --format '{{.Name}}' $(hostname) | sed 's/\///')

# Task 2: Change '<VirtualHost *:80>' to '<VirtualHost 172.18.0.100:80>' in 000-default.conf
# Use sed to replace the line in-place
sudo sed -i 's|<VirtualHost \*:80>|<VirtualHost 172.18.0.100:80>|' /etc/apache2/sites-available/000-default.conf

# Task 3: Add 'ServerName 172.18.0.100' to /etc/apache2/sites-available/000-default.conf
# Check if the line already exists, if not, add it below the <VirtualHost> line
grep -q "ServerName 172.18.0.100" /etc/apache2/sites-available/000-default.conf || sudo sed -i '/<VirtualHost 172.18.0.100:80>/a ServerName 172.18.0.100' /etc/apache2/sites-available/000-default.conf

# Task 4: return active container ID to the curl response
grep -q 'Header set container_id "${HOSTNAME}e"' /etc/apache2/apache2.conf || echo 'Header set container_id "${HOSTNAME}e"' | sudo tee -a /etc/apache2/apache2.conf

# Task 5: return active container hostname to the curl response 
grep -q 'Header set container_Name' /etc/apache2/apache2.conf || echo "Header set container_Name \"$container_name\"" | sudo tee -a /etc/apache2/apache2.conf

# Activate Headers in curl response
a2enmod headers


# Restart Apache to apply changes
apache2ctl restart

echo "Configuration changes applied and Apache restarted."
