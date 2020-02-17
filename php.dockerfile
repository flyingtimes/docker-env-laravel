FROM php:7.2-fpm-alpine

WORKDIR /var/www/
# 修改源地址为阿里云镜像地址
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
# 添加laravel所需的pdo和mysql插件
RUN docker-php-ext-install pdo pdo_mysql
