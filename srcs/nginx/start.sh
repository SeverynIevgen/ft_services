#!/bin/sh

rm -f /var/cache/apk/*

# Creating zdawnsta user for nginx
echo -e "12345\n12345" | adduser zdawnsta

# Creating of necessary directories
mkdir -p /run/nginx /etc/ssl/certs /etc/ssl/private

# Moving landing page
cp /var/lib/nginx/html/index.html /var/www/index.html

# Allowing ssh connection
cd /etc/ssh && ssh-keygen -A

# Generation of SSL
openssl req		-newkey rsa:2048 \
			-x509 \
			-sha256 \
			-nodes \
			-days 365 \
			-keyout /etc/ssl/certs/nginx.key \
			-out /etc/ssl/certs/nginx.crt \
			-subj "/C=RU/ST=Moscow/L=Domodedovo/O=School21/OU=IT/CN=zdawnsta"

# Starting of services
rm /etc/telegraf.conf &&
#telegraf &
#/usr/sbin/sshd && /usr/sbin/nginx -g 'daemon off;'
/usr/bin/supervisord -c /etc/supervisord.conf
