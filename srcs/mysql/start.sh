#!/bin/sh

rm -rf /var/cache/apk/*

#telegraf &

./db_init.sh &
sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
/usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"
/usr/bin/mysqld_safe --user=mysql --datadir="/var/lib/mysql"


#sleep infinity
#rc default
#/etc/init.d/mariadb setup
#rc-service mariadb start
#mysql -u root mysql < init_db.sql
#mysql -u root wordpress  < wordpress.sql
#rc-service mariadb stop
#telegraf &
#/usr/bin/mysqld_safe --datadir='/var/lib/mysql'
