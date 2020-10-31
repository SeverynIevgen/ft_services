#!/bin/sh

rm -rf /var/cache/apk/*

rc default ;
/etc/init.d/mariadb setup
rc-service mariadb start 
mysql -u root mysql < init_db.sql;
mysql -u root wordpress  < wordpress_db.sql ;
rc-service mariadb stop ;
/usr/bin/mysqld_safe ;
