#!/bin/bash

CERT_PATH="/etc/security/certs"
CERT_FILE="${CERT_PATH}/cert.crt"
CERT_KEY="${CERT_PATH}/cert.key"
CERT_SUB="/C=BR/ST=São Paulo/L=São Paulo/O=42SP/OU=Inception/CN=GASOUZA/"

echo "*** START CREATING CERTIFICATE ***"
echo
echo "  cert file: ${CERT_FILE}"
echo "  key file:  ${CERT_KEY}"

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -out "$CERT_FILE" -keyout "$CERT_KEY" -subj "$CERT_SUB"

echo "*** END CREATING CERTIFICATE ***"

exec "$@"