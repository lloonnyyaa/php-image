FROM php:fpm-alpine

RUN apk add --update \
    composer \
    zip \
    libzip-dev \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev

RUN docker-php-ext-configure gd --with-freetype --with-jpeg

RUN docker-php-ext-install pdo \
    pdo_mysql \
    gd \
    zip \
    opcache 

RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*

ADD php.ini $PHP_INI_DIR/conf.d/
