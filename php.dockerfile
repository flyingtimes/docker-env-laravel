FROM php:7.2-fpm-alpine

WORKDIR /var/www/
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN docker-php-ext-install pdo pdo_mysql
