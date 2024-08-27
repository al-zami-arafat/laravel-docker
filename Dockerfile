# Use PHP with Apache as the base image
FROM php:8.2-apache

# Install Additional System Dependencies
RUN apt-get update  \
    && apt-get install -y libzip-dev zip

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql

# Set the working directory
WORKDIR /var/www/html

# Copy the application code
COPY . /var/www/html

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENV PORT=8000

RUN chmod +x docker/entrypoint.sh

# Set extra file path
#ENTRYPOINT [ "docker/entrypoint.sh" ]

