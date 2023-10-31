#!/bin/bash

# if [ -d "/var/lib/mysql/${SQL_DATABASE}" ]
# then
# 	echo "--> ${SQL_DATABASE} allready exist\n"
# else
	echo "Creating database..."
	service mariadb start;
	sleep 5
	mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
	echo "MAT : Database created"
	mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
	echo "MAT : First user created"
	mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
	echo "MAT : Privileges granted on first user"
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@localhost IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
	echo "MAT : Privileges granted on root user"
	mysql -e "FLUSH PRIVILEGES;"

	sleep 5
	mysqladmin -u root -p{SQL_ROOT_PASSWORD} shutdown
# fi
sleep 5
exec mysqld
