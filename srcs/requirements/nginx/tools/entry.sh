#!/bin/bash

CERT_PATH="/app/security/certs"
CERT_FILE="${CERT_PATH}/cert.crt"
CERT_KEY="${CERT_PATH}/cert.key"
CERT_SUB="/C=BR/ST=Sao Paulo/L=Sao Paulo/O=42 Sao Paulo/OU=Inception/CN=Gabriel Souza/"

if ! [ -e $CERT_FILE ]; then

    sleep 8

    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -out "$CERT_FILE" \
        -keyout "$CERT_KEY" \
        -subj "$CERT_SUB"

fi

echo
echo "Nginx web server is running!"
echo

exec "$@"