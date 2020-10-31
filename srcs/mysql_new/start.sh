#!/bin/sh

rm -rf /var/cache/apk/*

# Creation of necessary folders
mkdir -p /var/lib/mysql /run/mysqld

# Installing and starting of services
echo 'Initializing database'
mysql_install_db --user=zdawnsta > /dev/null
echo 'Database initialized'

# create temp file
tfile=`mktemp`
if [ ! -f "$tfile" ]; then
    return 1
fi

# save sql
echo "[i] Create temp file: $tfile"
cat << EOF > $tfile
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'zdawnsta'@'%' IDENTIFIED BY '12345' WITH GRANT OPTION;
EOF

echo 'FLUSH PRIVILEGES;' >> $tfile

# run sql in tempfile
echo "[i] run tempfile: $tfile"
/usr/bin/mysqld --user=zdawnsta --bootstrap --verbose=0 < $tfile
rm -f $tfile

echo "[i] Sleeping 5 sec"
sleep 5

echo '[i] start running mysqld'
rm /etc/telegraf.conf && telegraf &
exec /usr/bin/mysqld --user=mysql --console
