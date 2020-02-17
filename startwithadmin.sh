#!/bin/bash
docker-compose run --rm composer require encore/laravel-admin
docker-compose exec php php artisan vendor:publish --provider="Encore\Admin\AdminServiceProvider"
docker-compose exec php php artisan admin:install
# set lang to zh-CN
docker-compose run --rm composer require caouecs/laravel-lang
docker-compose run --rm composer sed -i "s/'locale' => 'en'/'locale' => 'zh-CN'/g" /var/www/config/app.php
# install helper plugin
docker-compose run --rm composer require laravel-admin-ext/helpers
docker-compose exec php php artisan admin:import helpers
# install log-viewer plugin
docker-compose run --rm composer require laravel-admin-ext/log-viewer
docker-compose exec php php artisan admin:import log-viewer
cp admin_conf/filesystem.php src/config/
