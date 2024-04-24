#!/bin/bash

echo
echo "*** START DATABASE CONFIGURATION ***"
echo

service mariadb start

until [ -e /run/mysqld/mysqld.sock ]
do
    sleep 1
done

sleep 5

mariadb -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${DATABASE_ROOT_PASS}');"
mariadb -u root -e "FLUSH PRIVILEGES;"

mariadb -u root -e "CREATE USER IF NOT EXISTS '${DATABASE_USER}'@'%' IDENTIFIED BY '${DATABASE_PASS}';"
mariadb -u root -e "FLUSH PRIVILEGES;"

mariadb -u root -e "CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME};"
mariadb -u root -e "GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO '${DATABASE_USER}'@'%';"
mariadb -u root -e "FLUSH PRIVILEGES;"

service mariadb stop

echo
echo "*** END DATABASE CONFIGURATION ***"
echo

exec "$@"