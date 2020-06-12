FROM php:7.4-apache

# add some dependencies
RUN apt-get update \
    && apt-get install -y \
    apt-utils \
    libjpeg-dev  \
    curl \
    sed \
    zlib1g-dev

# Workaround for writing permission on write to MacOS X volumes
# See https://github.com/boot2docker/boot2docker/pull/534
RUN usermod -u 1000 www-data

# enable mod_rewrite of apache
# RUN a2enmod rewrite

# from : https://gist.github.com/Tazeg/a49695c24b97ca879d4b6806a206981e
# RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
# autorise .htaccess files
# RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# Setting php.ini with the right time zone
RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
RUN echo "date.timezone = Europe/Zurich" >> /usr/local/etc/php/php.ini
