#!/bin/bash
# 添加ui
docker-compose run --rm composer  require laravel/ui
# 添加auth前端，这里是使用vue组件
docker-compose exec php php artisan ui vue --auth
# 在数据库中添加相应的表
docker-compose exec php php artisan migrate
# 编译vue 前端组件
docker-compose run --rm npm install
docker-compose run --rm npm run dev

