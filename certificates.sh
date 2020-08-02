#!/bin/bash

export CA_KEY=${CA_KEY-"ca-key.pem"}
export CA_CERT=${CA_CERT-"ca.pem"}
export CA_SUBJECT=${CA_SUBJECT:-"test-ca"}
export CA_EXPIRE=${CA_EXPIRE:-"10000"}
export SSL_CONFIG=${SSL_CONFIG:-"/root/scripts/openssl.cnf"}
export SSL_KEY=${SSL_KEY:-"key.pem"}
export SSL_CSR=${SSL_CSR:-"key.csr"}
export SSL_CERT=${SSL_CERT:-"cert.pem"}
export SSL_SIZE=${SSL_SIZE:-"4096"}
export SSL_EXPIRE=${SSL_EXPIRE:-"10000"}
export SSL_SUBJECT=${SSL_SUBJECT:-"example.com"}


cd /root/cert

openssl genrsa -out ${CA_KEY} ${SSL_SIZE} > /dev/null

openssl req -x509 -new -nodes -key ${CA_KEY} -days ${CA_EXPIRE} -out ${CA_CERT} -extensions v3_ca -subj "/CN=${CA_SUBJECT}" > /dev/null  || exit 1

openssl genrsa -out ${SSL_KEY} ${SSL_SIZE} > /dev/null || exit 1

openssl req -new -key ${SSL_KEY} -out ${SSL_CSR} -subj  "/CN=${SSL_SUBJECT}"  -config ${SSL_CONFIG} > /dev/null || exit 1

openssl x509 -req -in ${SSL_CSR} -CA ${CA_CERT} -CAkey ${CA_KEY} -CAcreateserial -out ${SSL_CERT} \
    -days ${SSL_EXPIRE} -extensions v3_req -extfile ${SSL_CONFIG} > /dev/null || exit 1
