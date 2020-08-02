FROM paulczar/omgwtfssl
ADD certificates.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/certificates.sh
CMD /usr/local/bin/certificates.sh
