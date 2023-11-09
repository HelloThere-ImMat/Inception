#!/bin/sh

sleep 5

    echo "\n==============================="
    echo "=== Wordpress configuration ==="
    echo "===============================\n"

if [ -f "/var/www/html/wp-config.php" ]
then
    echo "==> wordpress is already installed and configured\n"
else
    wp core download --allow-root
    wp core config  --allow-root \
                    --dbname=$SQL_DATABASE \
                    --dbuser=$SQL_USER \
                    --dbpass=$SQL_PASSWORD \
                    --dbhost=mariadb:3306
    wp core install --allow-root\
                    --url="mdorr.42.fr"\
                    --title="batsite"\
                    --admin_user=$WP_ADMIN_USER\
                    --admin_password=$WP_ADMIN_PASSWORD\
                    --admin_email=$WP_ADMIN_EMAIL
   wp user create $WP_SUSCRIBER_USER $WP_SUSCRIBER_EMAIL\
                    --role=suscriber\
                    --user_pass=$WP_SUBSCRIBER_PASSWORD\
                    --allow-root
fi

exec /usr/sbin/php-fpm7.4 -F
