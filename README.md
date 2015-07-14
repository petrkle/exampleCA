# exampleCA

Testovací certifikační autorita

Vytvoření CA - jen jednou, nastavit hodnoty v openssl.conf

> rm -rf .git index.txt.* certs/* private/*  csr/* newcerts/* serial.old && echo 1000 > serial
>
> openssl req -config openssl.cnf -new -x509 -keyout private/cakey.pem -out cacert.pem -days 5000 -sha512


Výpis příkazů pro vygenerování a podepsání certifikátu

> ./makecert.sh foo.example.com

Heslo pro cakey.pem nFusvs2rWmrsh9p

## Upozornění

Certifikační autoritu si vygenerujte vlastní. Soubor cacert.pem
z tohoto uložiště si mezi důvěryhodné CA přidejte, pouze pokud
víte co děláte.
