#!/bin/bash
git config --global http.sslVerify false

echo "Composer Install / update"
composer install --prefer-dist --optimize-autoloader --no-progress --no-scripts --no-interaction

echo "Executando permissões"
chmod -R 777 /var/www/html/storage/*
chown -R www-data:www-data /var/www/html/*

echo "Gerando app key local"
php artisan key:generate

php artisan optimize

#php artisan migrate
#php artisan db:seed --class=PessoaSeeder