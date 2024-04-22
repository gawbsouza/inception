#!/bin/bash

DB_NAME="db_wp"
DB_USER="db_user"
DB_PASS="db_pass"
DB_ROOT_PASS="db_root_pass"

echo "*** START DATABASE CONFIGURATION ***"
echo

echo "ligando mariadb"
service mariadb start
echo "retorno $?"

sleep 4
# Setup Root User
echo "configurando root"
mariadb -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${DB_ROOT_PASS}');"
echo "retorno $?"
# sleep 2
# mariadb -u root -p ${DB_ROOT_PASS} "GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';"
# mariadb -u root -p "${DB_ROOT_PASS}" "FLUSH PRIVILEGES;"

# Create App user
echo "configurando usuario"
mariadb -u root -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';"
echo "retorno $?"
echo "dando flush"
mariadb -u root -e "FLUSH PRIVILEGES;"
echo "retorno $?"

# sleep 2

echo "criando database"
# Create App Database
mariadb -u root -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
echo "retorno $?"
echo "adicionando usuario a database"
mariadb -u root -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"
echo "retorno $?"
echo "dando flush"
mariadb -u root -e "FLUSH PRIVILEGES;"
echo "retorno $?"

# sleep 2

echo "desligando mariadb"
service mariadb stop
echo "retorno $?"

echo "*** END DATABASE CONFIGURATION ***"

# sleep 2

echo "executando mysqld_safe"
# mysqld_safe