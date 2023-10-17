#!/bin/bash

lock_file="/var/www/html/.setup_complete"

if [ ! -f "$lock_file" ]; then
	sleep 10
    echo "config does not exist. Performing actions..."
	wp core download --allow-root
	wp config create	--allow-root \
						--skip-check \
						--dbname=$SQL_DATABASE \
						--dbuser=$SQL_USER \
						--dbpass=$SQL_PASSWORD \
						--dbhost=mariadb:3306 --path='/var/www/wordpress'
    echo "Actions completed."
	until wp db check --path=/var/www/html --quiet --allow-root; do
        echo "Waiting for MySQL..."
        sleep 1
    done
	wp core install		--url="mdorr.42.fr" \
						--title="batsite" \
						--admin_user=$WP_ADMIN_USER \
						--admin_password=$WP_ADMIN_PASSWORD \
						--admin_email=$WP_ADMIN_EMAIL \
						--allow-root
	wp user create 		$WP_SUBSCRIBER_USER $WP_SUBSCRIBER_EMAIL \
						--role=subscriber \
						--user_pass=$WP_SUBSCRIBER_PASSWORD \
						--allow-root
	echo "Wordpress setup complete"
	touch $lock_file
else
    echo "config already exists. No actions needed."
fi

if [! -f "/run/php"]; then
	mkdir -p /run/php
fi

exec /usr/sbin/php-fpm7.3 -F
