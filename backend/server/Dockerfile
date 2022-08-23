FROM php:7.4-apache AS server

RUN pecl install xdebug
COPY docker/90-xdebug.ini "${PHP_INI_DIR}/conf.d"

RUN a2enmod rewrite
RUN service apache2 restart

FROM php:7.4 AS script

RUN docker-php-ext-install pdo pdo_mysql