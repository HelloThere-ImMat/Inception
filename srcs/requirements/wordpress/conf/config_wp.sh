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
   wp user create $WP_USER $WP_USER_EMAIL\
                    --role=author\
                    --user_pass=$WP_USER_PASSWORD\
                    --allow-root
fi

echo "\n==========================="
    echo "=== Redis configuration ==="
    echo "===========================\n"

    wp config set WP_CACHE true --add --allow-root
    wp config set WP_CACHE_KEY_SALT mdorr.42.fr --allow-root
    wp config set WP_REDIS_HOST redis --allow-root
    wp plugin install redis-cache --activate --allow-root
    wp plugin update --all --allow-root
    wp redis enable --allow-root

echo "ALL DONE"

exec /usr/sbin/php-fpm7.4 -F
