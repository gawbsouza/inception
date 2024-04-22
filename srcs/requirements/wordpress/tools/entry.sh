#!/bin/bash

SITE_HOST="localhost"
SITE_NAME="Gasouza's Blog"
SITE_ADMIN_USER="gasouza"
SITE_ADMIN_PASS="pass"
SITE_ADMIN_MAIL="gasouza@42sp.org"

DB_HOST="mariadb"
DB_NAME="db_wp"
DB_USER="db_user"
DB_PASS="db_pass"

# verificar diretamente se o arquivo de config já existe
if ! wp core is-installed --allow-root 2> /dev/null; then

    sleep 10

    echo
    echo "*** START WORDPRESS INSTALATION ***"
    echo

    wp core download --path=/app --allow-root
    wp config create --dbhost="${DB_HOST}" --dbname="${DB_NAME}" --dbuser="${DB_USER}" --dbpass="${DB_PASS}" --allow-root
    wp core install --url="${SITE_HOST}}" --title="${SITE_NAME}" --admin_user="${SITE_ADMIN_USER}" --admin_password="${SITE_ADMIN_PASS}" --admin_email="${SITE_ADMIN_MAIL}" --allow-root

    echo
    echo "*** END WORDPRESS INSTALATION ***"
    echo

fi

exec "$@"