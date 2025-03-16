#!/bin/bash

echo "Waiting for MySQL to be ready..."
while ! nc -z mysql 3306; do
    sleep 1
done
echo "MySQL is ready!"


# Wait for MySQL to be ready
# ./scripts/wait-for-db.sh mysql:3306 -t 60

# Install dependencies
# composer install --no-interaction --no-plugins --no-scripts

# Generate app key if not set
php artisan key:generate --no-interaction --force

# Run migrations
php artisan migrate --force

php artisan db:seed --force

# Start PHP-FPM
# Start PHP-FPM
exec php-fpm -y /usr/local/etc/php-fpm.conf -R