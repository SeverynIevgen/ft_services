#!/bin/sh

rm -rf /var/cache/apk/*

# Creation of necessary folders
mkdir -p /var/lib/mysql /run/mysqld

# Installing and starting of services
mysql_install_db -u root > /dev/null
/usr/bin/mysqld_safe -u root --console &
sleep 5

# Creation of wordpress database if not already exist
#if ! mysql -u root -e 'USE wordpress_db'; then
#	mysql -u root -e 'CREATE DATABASE wordpress_db;'
#	mysql -u root wordpress_db < /wordpress_db.sql
#fi

# Creation of database for user zdawnsta as admin
mysql -u root mysql < init_db.sql
mysql -u root wordpress_db  < wordpress_db.sql
#mysql -u root -e "CREATE USER 'zdawnsta'@'%' IDENTIFIED BY '12345'; GRANT ALL PRIVILEGES ON *.* TO 'zdawnsta'@'%' WITH GRANT OPTION; USE wordpress_db; FLUSH PRIVILEGES;"

#/usr/bin/supervisord -c /etc/supervisord.conf
telegraf &
/usr/bin/mysqld_safe --datadir='/var/lib/mysql'
# Avoiding container to stop
#sleep infinity
