FROM composer:latest

WORKDIR /var/www/
RUN composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/