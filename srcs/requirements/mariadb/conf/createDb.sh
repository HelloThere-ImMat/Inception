#!/bin/bash

if [ -d "/var/lib/mysql/${SQL_DATABASE}" ]
then
	echo "--> ${SQL_DATABASE} allready exist\n"
else
	echo "Creating database..."
	service mariadb start;
	sleep 5
	mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
	mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
	mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
	mysql -e "GRAND ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
	#mysql -e "FLUSH PRIVILEGES;"

	sleep 5
	mysqladmin -u root -p{SQL_ROOT_PASSWORD} shutdown
fi
sleep 5
exec mysqld
