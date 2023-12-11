#!/bin/sh
service mariadb start
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e -p$MYSQL_ROOT_PASSWORD "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e -p$MYSQL_ROOT_PASSWORD "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO 'root'@'localhost' IDENTIFIED BY \`${MYSQL_ROOT_PASSWORD}\` WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD(\`$MYSQL_ROOT_PASSWORD\`);"
mysql -e "FLUSH PRIVILEGES;"
sleep 1
mysqladmin -u root shutdown
#mysqld --bind-address=0.0.0.0
exec mysqld_safe
