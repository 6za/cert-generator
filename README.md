# cert-generator
 A wrapper for `paulczar/omgwtfssl` to simplify certificates generation for docker hosts 


```bash 
docker build -t certs .
docker run -v $PWD/openssl.cnf:/root/scripts/openssl.cnf -v $PWD/certs_20211022:/root/cert certs
```
