FROM php:8.1.25-apache

COPY . /var/www/html


RUN apt-get update && apt-get install -y \
    libfreetype-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
&& rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

RUN pecl install redis-5.3.7 \
   && pecl install xdebug-3.2.1 \
   && docker-php-ext-enable redis xdebug
   
RUN docker-php-ext-install pdo pdo_mysql


RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"


USER www-data
