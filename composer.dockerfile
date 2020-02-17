FROM composer:latest

WORKDIR /var/www/
# 修改源地址为阿里云镜像地址
RUN composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/