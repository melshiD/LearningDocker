FROM php:8.0-fpm-alpine
 
WORKDIR /var/www/html
 
COPY src .
 
RUN docker-php-ext-install pdo pdo_mysql
 
RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

USER laravel 
 
# RUN chown -R laravel:laravel .
#then he toiled the day on the university computer
#how to integrate my workflows?
#still working in other computer.  how to integrate?
#and a repeat of last night, as well