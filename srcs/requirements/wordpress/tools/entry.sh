#!/bin/bash

if ! [ -e "/app/index.php" ]; then

    sleep 10

    wp core download --allow-root

    wp config create --allow-root \
        --dbhost="mariadb" \
        --dbname="$DATABASE_NAME" \
        --dbuser="$DATABASE_USER" \
        --dbpass="$DATABASE_PASS"

    wp core install --allow-root \
        --url="$WP_SITE_HOST" \
        --title="$WP_SITE_NAME" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASS" \
        --admin_email="$WP_ADMIN_MAIL"

    wp user create --allow-root "$WP_EDITOR_USER" "$WP_EDITOR_MAIL" \
        --user_pass="$WP_EDITOR_PASS" \
        --role=editor 

fi

echo
echo "Wordpress web site is running!"
echo

exec "$@"