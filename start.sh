echo "環境を選択してください local|dev|prod\n"

read env



cd ./laravel
../phar/composer.phar install

cd ../docker
/usr/local/bin/docker-compose up -d

if [ $env = "local" ]; then
	docker exec -it laravel_test_app chown -R apache:apache /var/www/html/laravel/storage /var/www/html/laravel/bootstrap/cache
	docker exec -it laravel_test_app php /var/www/html/laravel/artisan serve --host 0.0.0.0
else
	/usr/bin/docker exec -it laravel_test_app chown -R apache:apache /var/www/html/laravel/storage /var/www/html/laravel/bootstrap/cache
	/usr/bin/docker exec -it laravel_test_app php /var/www/html/laravel/artisan serve --host 0.0.0.0
fi






