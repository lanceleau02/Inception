#!/bin/sh
sleep 5
if [ ! -e /var/www/wordpress/wp-config.php ]; then
	cd /var/www/wordpress/
	wp core download --allow-root
	wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb
	sleep 2
	wp core install --allow-root --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email
	wp user create --allow-root $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD
fi

cd /
if [ ! -d /run/php ]; then
    mkdir ./run/php
fi

/usr/sbin/php-fpm7.4 -F
