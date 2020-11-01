#!/bin/sh

rm -f /var/cache/apk/*

# Starting of services
rm /etc/telegraf.conf
#/usr/bin/supervisord -c /etc/supervisord.conf
#telegraf & 
php -S 0.0.0.0:5050 -t /var/www/wordpress/
nginx -g "daemon off;"
