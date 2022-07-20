FROM php:7.4-apache

RUN pecl install xdebug
COPY docker/90-xdebug.ini "${PHP_INI_DIR}/conf.d"

RUN a2enmod rewrite
RUN service apache2 restart