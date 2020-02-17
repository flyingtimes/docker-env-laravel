FROM node:latest

WORKDIR /var/www/
RUN npm config set registry https://registry.npm.taobao.org
