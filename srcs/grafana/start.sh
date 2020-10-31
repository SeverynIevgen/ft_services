#!/bin/sh

rm -rf /var/cache/apk/*

# Starting of services
rm /etc/telegraf.conf
/usr/bin/supervisord -c /etc/supervisord.conf
#telegraf & /usr/sbin/grafana-server
