until mysqladmin ping
do
	sleep 1
done
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "CREATE USER 'zdawnsta'@'%' IDENTIFIED BY '12345';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'zdawnsta'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
mysql -u root wordpress < wordpress.sql
