#!/bin/bash

CERT_PATH="/etc/security/certs"
CERT_FILE="${CERT_PATH}/cert.crt"
CERT_KEY="${CERT_PATH}/cert.key"
CERT_SUB="/C=BR/ST=Sao Paulo/L=Sao Paulo/O=42SP/OU=Inception/CN=Gabriel Souza/"

if ! [ -e /etc/security/certs/cert.crt ]; then

    sleep 10

    echo
    echo "*** START CERTIFICATE CREATION ***"
    echo

    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -out "$CERT_FILE" \
        -keyout "$CERT_KEY" \
        -subj "$CERT_SUB" > /dev/null 2> /dev/null

    if [ $? -eq 0 ]; then
        echo "Certificate created..." 

        echo
        echo "cert file: ${CERT_FILE}"
        echo "key file:  ${CERT_KEY}"
        echo
    fi

    echo "*** END CERTIFICATE CREATION ***"

fi

echo
echo "Nginx web server is running!"
echo

exec "$@"