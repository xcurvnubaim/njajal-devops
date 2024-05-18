# Stage 1: Build Laravel Application
FROM composer:2 AS composer
WORKDIR /app
COPY . .
RUN rm -f .env
RUN composer update
RUN composer install --no-dev

# Stage 2: Final Image
FROM php:8.3-fpm-alpine
WORKDIR /var/www/html
RUN docker-php-ext-install pdo pdo_mysql
COPY --from=composer /app .
CMD ["php", "artisan", "serve", "--host=0.0.0.0"]