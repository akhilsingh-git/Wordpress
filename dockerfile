# Pull the official WordPress image as our base
FROM wordpress:latest

# Use Apache
RUN a2enmod rewrite

# Install additional PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

# Copy the entire contents of our project into our Docker container
COPY . /var/www/html



