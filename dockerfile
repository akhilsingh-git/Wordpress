# Use an official PHP runtime with Apache as a parent image
FROM php:7.4-apache

# Enable Apache mod_rewrite for WordPress permalinks
RUN a2enmod rewrite

# Copy the entire project and its contents into the Docker image
COPY . /var/www/html/

# Set ownership of all files to the Apache user
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

# Expose port 80 for the Apache web server
EXPOSE 80

# Update the default apache site with the config we created.
ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf

