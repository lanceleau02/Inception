#!/bin/sh
/etc/init.d/mariadb start;
sleep 10
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | mysql_secure_installation
	  # current root password (emtpy after installation)
	y # Set root password?
	${MYSQL_ROOT_PASSWORD} # new root password
	${MYSQL_ROOT_PASSWORD} # new root password
	y # Remove anonymous users?
	y # Disallow root login remotely?
	y # Remove test database and access to it?
	y # Reload privilege tables now?
EOF
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
exec "$@"
