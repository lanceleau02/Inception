#!/bin/sh

cd /var/www/html/

if [ -f "/var/www/html/wordpress/wp-config.php" ]
then
	echo "Wordpress already installed and setup"
else
	wp core download --allow-root
	wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --extra-php
	wp core install --allow-root --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL
	if ! wp user list --allow-root --field=user_login --name=$WP_USER > /dev/null; then
    		wp user create --allow-root $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role='editor'
	else
    		echo "User already exists."
	fi
fi

/usr/sbin/php-fpm7.4 -F
