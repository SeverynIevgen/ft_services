#!/bin/sh

rm -rf /var/cache/apk/*

# Generation of SSL
openssl req	-newkey rsa:2048 \
		-x509 \
		-sha256 \
		-nodes \
		-days 365 \
		-keyout /etc/ssl/private/pure-ftpd.pem \
		-out /etc/ssl/private/pure-ftpd.pem \
		-subj "/C=RU/ST=Moscow/L=Domodedovo/O=School21/OU=IT/CN=zdawnsta"

# Creating ftps user zdawnsta as admin
echo -e "12345\n12345" | adduser zdawnsta

# Starting of services
rm /etc/telegraf.conf
#/usr/bin/supervisord -c /etc/supervisord.conf
#telegraf & 
/usr/sbin/pure-ftpd -p 21000:21000 -P $IP
