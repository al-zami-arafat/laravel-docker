#!/bin/bash

if [ !"vendor/autoload.php" ]; then
    composer install
fi

if [ !".env" ]; then
    cp .env.example .env
fi

php artisan maigrate --seed
php artisan key:generate
php artisan cache:clear
php artisan config:clear
php artisan route:clear

php artisan serve --port=$PORT --host=0.0.0.0

exec docker-php-entrypoint "$@"

