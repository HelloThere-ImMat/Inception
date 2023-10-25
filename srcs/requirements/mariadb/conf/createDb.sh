#!/bin/bash

service mariadb start;
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRAND ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
#mysql -e "FLUSH PRIVILEGES;"
