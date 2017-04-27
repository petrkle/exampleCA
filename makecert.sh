#!/usr/bin/bash

FQDN=$1

[ -z $FQDN ] && echo "usage: $0 fqdn" && exit 1

echo "[req]
default_bits = 4096
prompt = no
default_md = sha256
distinguished_name = dn

[dn]
C=AU
ST=example
L=example.com
O=example
OU=example
emailAddress=info@example.com
CN = ${FQDN}" > ${FQDN}.csr.cnf

echo "authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = ${FQDN}" > ${FQDN}.v3.ext

openssl req -new -sha256 -nodes -out ${FQDN}.csr -newkey rsa:4096 -keyout ${FQDN}.key -config <( cat ${FQDN}.csr.cnf )

openssl x509 -req -in ${FQDN}.csr -CA exampleCA.pem -CAkey exampleCA.key -CAcreateserial -out ${FQDN}.pem -days 5000 -sha256 -extfile ${FQDN}.v3.ext -passin file:password.txt
