#!/bin/bash

FQDN=$1

[ -z $FQDN ] && echo "usage: $0 fqdn" && exit 1

# vygenerovani zadosti o certifikat
echo "openssl req -config openssl.cnf -new -keyout private/${FQDN}-key.pem -out csr/${FQDN}-req.pem -days 5000 -sha256"

# podepsani certifikatu
echo "openssl ca -config openssl.cnf -policy policy_anything -out certs/${FQDN}.pem -infiles csr/${FQDN}-req.pem"

# odstraneni hesla
echo "openssl rsa -in private/${FQDN}-key.pem -out private/${FQDN}.key"
