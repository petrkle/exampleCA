#!/usr/bin/env bash

set -e

strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n' > password.txt
openssl genrsa -des3 -out exampleCA.key -passout file:password.txt 4096
openssl req -x509 -new -nodes -key exampleCA.key -sha256 -days 5000 -out exampleCA.pem -passin file:password.txt
