# Stage 1: Build environment
FROM php:8.3-cli AS builder

# Install build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    libpng-dev libjpeg-dev libfreetype6-dev \
    zip unzip libzip-dev \
    libpq-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd zip pdo_pgsql pgsql exif

# Enable required PHP extensions
RUN docker-php-ext-enable gd zip exif

WORKDIR /var/www
COPY . /var/www

RUN mkdir -p bootstrap/cache storage/framework/{sessions,views,cache} \
    && chmod -R 775 bootstrap/cache storage \
    && chown -R www-data:www-data bootstrap/cache storage

# Install Composer and Laravel dependencies
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer 

RUN composer install --no-dev --optimize-autoloader --no-interaction --no-progress --prefer-dist

# Stage 2: Production environment
FROM php:8.3-cli

# Install runtime dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    postgresql-client netcat-traditional \
    libpng16-16 libjpeg62-turbo libzip4 libfreetype6 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy necessary files from builder stage
COPY --from=builder /usr/local/lib/php/extensions/ /usr/local/lib/php/extensions/
COPY --from=builder /usr/local/etc/php/conf.d/ /usr/local/etc/php/conf.d/
COPY --from=builder /var/www /var/www

WORKDIR /var/www
# Set permissions for storage and bootstrap/cache
# RUN chmod -R 775 storage 

RUN chown -R www-data:www-data /var/www \
    && chmod -R 775 storage bootstrap/cache
# RUN php artisan migrate --force && php artisan db:seed --force

# RUN chmod -R 775 bootstrap/cache

# Set entrypoint script
COPY ./scripts .
RUN chmod +x scripts/php-starter.sh
ENTRYPOINT ["scripts/php-starter.sh"]
# Expose port and run Laravel's built-in server
EXPOSE 8000
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
