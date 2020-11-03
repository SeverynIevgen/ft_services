#!/bin/sh

rm -f /var/cache/apk/*

# Starting of services
/usr/bin/supervisord -c /etc/supervisord.conf