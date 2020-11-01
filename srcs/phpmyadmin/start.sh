#!/bin/sh

rm -f /var/cache/apk/*

# Starting of services
/usr/bin/supervisord -c /etc/supervisord.conf
#telegraf & 
#php -S 0.0.0.0:5000 -t /var/www/phpmyadmin
#nginx -g "daemon off;"
