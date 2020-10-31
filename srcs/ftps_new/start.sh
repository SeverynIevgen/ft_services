#!/bin/sh

rm -rf /var/cache/apk/*

# Generation of SSL
openssl req	-newkey rsa:2048 \
		-x509 \
		-sha256 \
		-nodes \
		-days 365 \
		-keyout /etc/ssl/ssl.key \
		-out /etc/ssl/ssl.crt \
		-subj "/C=RU/ST=Moscow/L=Domodedovo/O=School21/OU=IT/CN=zdawnsta"

# Creating ftps user zdawnsta as admin
echo -e "12345\n12345" | adduser zdawnsta --home /home/zdawnsta

# Starting of services
rm /etc/telegraf.conf && telegraf &
vsftpd /etc/vsftpd/vsftpd.conf