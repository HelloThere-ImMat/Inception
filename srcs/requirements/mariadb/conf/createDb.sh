#!/bin/bash

 if [ -d "/var/lib/mysql/${SQL_DATABASE}" ]
 then
 	echo "--> ${SQL_DATABASE} allready exist\n"
 else
	echo "Creating database..."
	service mariadb start;
	sleep 1
	mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
	echo "MAT : Database created"
	mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
	echo "MAT : First user created"
	mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@localhost IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

	sleep 1
	mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown
fi
sleep 1
exec mysqld

#service mysql start

#mysql -u root -e "CREATE DATABASE ${SQL_DATABASE};"
#mysql -u root -e "CREATE USER '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
#mysql -u root -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%';"
#mysql -u root -e "FLUSH PRIVILEGES;"
#mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"