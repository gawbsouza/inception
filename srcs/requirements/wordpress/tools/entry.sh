#!/bin/bash

if ! wp core is-installed --allow-root 2> /dev/null; then

    sleep 10

    echo
    echo "*** START WORDPRESS INSTALATION ***"
    echo

    wp core download --allow-root

    wp config create --allow-root \
        --dbhost="mariadb" \
        --dbname="${WORDPRESS_DB_NAME}" \
        --dbuser="${WORDPRESS_DB_USER}" \
        --dbpass="${WORDPRESS_DB_PASS}" 

    wp core install --allow-root \
        --url="$WORDPRESS_SITE_HOST" \
        --title="$WORDPRESS_SITE_NAME" \
        --admin_user="$WORDPRESS_ADMIN_USER" \
        --admin_password="$WORDPRESS_ADMIN_PASS" \
        --admin_email="$WORDPRESS_ADMIN_MAIL"

    echo
    echo "*** END WORDPRESS INSTALATION ***"
    echo

fi

echo
echo "Wordpress Blog Running!"
echo

exec "$@"