#!/bin/bash

if ! wp core is-installed --allow-root 2> /dev/null; then

    sleep 10

    echo
    echo "*** START WORDPRESS INSTALATION ***"
    echo

    wp core download --allow-root > /dev/null

    if [ $? -eq 0 ]; then
        echo "Wordpress downloaded..."
    fi

    wp config create --allow-root \
        --dbhost="mariadb" \
        --dbname="$DATABASE_NAME" \
        --dbuser="$DATABASE_USER" \
        --dbpass="$DATABASE_PASS" > /dev/null

    if [ $? -eq 0 ]; then
        echo "Wordpress database configured..."
    fi

    wp core install --allow-root \
        --url="$WP_SITE_HOST" \
        --title="$WP_SITE_NAME" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASS" \
        --admin_email="$WP_ADMIN_MAIL" > /dev/null

    if [ $? -eq 0 ]; then
        echo "Wordpress intalled with admin user..."
    fi

    wp user create --allow-root "$WP_EDITOR_USER" "$WP_EDITOR_MAIL" \
        --user_pass="$WP_EDITOR_PASS" \
        --role=editor > /dev/null 

    if [ $? -eq 0 ]; then
        echo "Additional user created..."
    fi

    echo
    echo "*** END WORDPRESS INSTALATION ***"
    echo

fi

echo "Wordpress web site is running!"
echo

exec "$@"