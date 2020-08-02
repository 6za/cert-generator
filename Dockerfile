FROM paulczar/omgwtfssl
ADD certificates.sh /usr/local/bin/generate-certs/certificates.sh
RUN chmod +x /usr/local/bin/generate-certs/certificates.sh
