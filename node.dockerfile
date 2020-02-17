FROM node:latest

WORKDIR /var/www/
# 修改源地址为阿里云镜像地址
RUN npm config set registry https://registry.npm.taobao.org
