# docker-env-laravel
这是一个干净的laravel容器化开发环境。同时为了便于国内用户开发，php、npm、composer容器里面已经设置好了阿里云镜像源。

## 快速开始

运行quickstart.sh，其内容包含以下几部分：
php开发环境的建立
```sh
# 本地编译容器环境
docker-compose build
# 运行容器环境
docker-compose up -d
```
laravel基础功能导入
```sh
# 创建项目目录
mkdir src
# 调用composer容器，运行laravel初始化命令，将自动通过阿里云镜像源拉取初始化代码
docker-compose run --rm composer laravel/laravel .
# 在镜像里，laravel的配置文件中数据库连接配置需要做响应的修改 127.0.0.1->mysql，库名、用户名、密码也要根据docker-compose.yml的配置做相应修改才行
docker-compose run --rm composer sed -i "s/DB_HOST=127.0.0.1/DB_HOST=mysql/g" /app/.env
docker-compose run --rm composer sed -i "s/DB_PASSWORD=/DB_PASSWORD=rootsecret/g" /app/.env
```

## 项目架构说明

### 目录结构
src/    存放laravel项目的代码
nginx/  nginx配置文件
docker-compose.yml  docker-compose 配置文件
*.dockerfile    几个容器都加上了镜像地址，相对于默认容器做了响应的修改

### nginx
负责开放8080端口，并将所有请求入口转发到容器内的/var/www/public（对应于本项目src/public)，php的响应会转发到php:9000处理。

### php
通过9000端口响应所有请求，laravel项目文件都在src/ 下

### composer
一个独立的容器，用来方便没有本地化安装composer的用户调用composer命令。调用方法：
```
docker-compose run --it composer <后面就是composer命令>
examples:
docker-compose run --it composer create-project laravel/laravel .
```

## 容器开放的端口

- **nginx** - `:8080`
- **mysql** - `:3306`
- **php** - `:9000`