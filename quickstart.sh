#!/bin/bash
echo '本脚本只能在第一次运行的时候使用，要重新开始，需要删除src文件夹'
# 本地编译容器环境
docker-compose build
# 运行容器环境
docker-compose up -d
# 创建项目目录
mkdir src
# 调用composer容器，运行laravel初始化命令，将自动通过阿里云镜像源拉取初始化代码
docker-compose run --rm composer create-project laravel/laravel .
# 在镜像里，laravel的配置文件中数据库连接配置需要做响应的修改 127.0.0.1->mysql，root的密码也要根据docker-compose.yml的配置做相应修改才行
# 默认库名为laravel，用户为root
docker-compose run --rm composer sed -i "s/DB_HOST=127.0.0.1/DB_HOST=mysql/g" /var/www/.env
docker-compose run --rm composer sed -i "s/DB_PASSWORD=/DB_PASSWORD=rootsecret/g" /var/www/.env
