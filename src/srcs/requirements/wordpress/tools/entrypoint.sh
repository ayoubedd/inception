#!/bin/bash

set -e

# Check if wordpress is already downloaded
if [ ! -f "/var/www/wordpress/wp-config-sample.php" ]; then
  wp core download --allow-root
fi

# Creates wp-config.php
if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
  wp config create --dbhost=$WP_DB_HOST \
    --dbname=$WP_DB_NAME \
    --dbuser=$WP_DB_USER \
    --dbpass=$WP_DB_PASSWORD \
    --allow-root
fi

# Installs wordpress if it's not already
if ! wp core is-installed --allow-root; then
  wp core install --title="$WP_TITLE" \
    --admin_user=$WP_ADMIN_USERNAME \
    --admin_password=$WP_ADMIN_PASS \
    --admin_email=$WP_ADMIN_EMAIL \
    --url=$WP_URL \
    --allow-root
fi


# Configure redis
wp config set WP_REDIS_SCHEME $WP_REDIS_SCHEME --add --allow-root
wp config set WP_REDIS_HOST $WP_REDIS_HOST --add --allow-root
wp config set WP_REDIS_PORT $WP_REDIS_PORT --add --allow-root
wp config set WP_REDIS_PASSWORD $WP_REDIS_PASSWORD --add --allow-root

# Install and active redis if doesn't already exist
if ! wp plugin is-installed redis-cache --allow-root; then
  wp plugin install redis-cache --activate --allow-root
fi

wp redis enable --allow-root

# Creates a regular author if doesn't already exist
if ! wp user list --field=display_name --allow-root | grep -q $WP_USER_NAME; then
  wp user create "$WP_USER_NAME" $WP_USER_EMAIL \
    --role=$WP_USER_ROLE \
    --user_pass=$WP_USER_PASS \
    --allow-root
fi

chown -R wordpress:wordpress /var/www/wordpress

PHP_FPM_CMD=$(ls /usr/sbin/ | grep php-fpm)
exec $PHP_FPM_CMD -F
