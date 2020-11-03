#!/bin/sh

rm -rf /var/cache/apk/*

./db_init.sh &
sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
/usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"

/usr/bin/supervisord -c /etc/supervisord.conf