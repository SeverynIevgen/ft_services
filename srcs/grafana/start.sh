#!/bin/sh

rm -rf /var/cache/apk/*

# Starting of services
/usr/bin/supervisord -c /etc/supervisord.conf
#telegraf & 
#/usr/sbin/grafana-server
